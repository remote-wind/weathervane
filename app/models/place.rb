# Places are used to cache geocode responses for services that require a reverse lookup
class Place
  include Mongoid::Document

  # Fields
  field :name, type: String
  field :lat, type: Float
  field :lon, type: Float
  field :geoname_id, type: Integer
  field :district, type: String
  field :country, type: String
  field :country_code, type: String

  # Validations
  validates_presence_of :name, :country, :district
  validates_numericality_of :lat, :lon, :geoname_id
  validates_format_of :country_code, with: /\A[a-zA-Z]{2}\Z/
end