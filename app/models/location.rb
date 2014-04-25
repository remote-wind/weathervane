# Locations are used to cache reverse geocode responses for services such as YR that require a lookup
require 'addressable/template'
require 'net/http'
require 'json'
require 'ostruct'

class Location
  include Mongoid::Document

  # Relations
  has_many :forecasts, class_name: 'Forecast'

  # Fields
  field :name, type: String
  field :lat, type: Float
  field :lng, type: Float
  field :geoname_id, type: Integer
  field :district, type: String
  field :country, type: String
  field :country_code, type: String

  # Validations
  validates_presence_of :name, :country, :district
  validates_numericality_of :lat, :lng, :geoname_id
  validates_format_of :country_code, with: /\A[a-zA-Z]{2}\Z/

  # Request a reverse geocode lookup from Geonames.org
  # @param lat Float
  # @param lng Float
  # @return OpenStruct || false - The decoded response
  def self.get_reverse_lookup( lat, lng )

    request_uri =  Addressable::Template.new('http://api.geonames.org/findNearbyPlaceNameJSON{?query*}/')
      .expand({
          'query' => {
              'lat' => lat,
              'lng' => lng,
              'username' => ENV['GEONAMES_USERNAME']
          }
      })

    response = Net::HTTP.get_response(request_uri)

    if response.is_a?(Net::HTTPSuccess)
      OpenStruct.new( JSON.parse(response.body)["geonames"].try('first') )
    else
      false
    end
  end

  # Create location from Geonames.org reverse geocode lookup
  # @param response OpenStruct
  # @return Location
  def self.new_from_geonames( response )
    self.new({
        name: response.try("toponymName"),
        lat: response.try("lat"),
        lng: response.try("lng"),
        geoname_id: response.try("geonameId"),
        district: response.try("adminName1"),
        country: response.try("countryName"),
        country_code: response.try("countryCode")
    })
  end

  # Check DB if location is cached otherwise do reverse lookup and store location
  # @param lat
  # @param lng
  # @return Location || nil - returns nil if lookup failed
  def self.find_or_create_by_lat_lng(lat, lng)

    begin
      location = self.find_by(lat: lat, lng: lng).presence
    rescue Mongoid::Errors::DocumentNotFound
      response = self.get_reverse_lookup(lat, lng)
      if response
        location = self.new_from_geonames( response )
        location.save!
      end

      return location
    end

  end

end