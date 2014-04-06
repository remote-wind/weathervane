# Adapter for Swedish Meteorological and Hydrological Institute forecast API pmp1.5g
# @see http://www.smhi.se/klimatdata/Oppna-data/Meteorologiska-data/api-for-vaderprognosdata-1.34233
class Weathervane::Forecasts::SMHI < Weathervane::Forecast

  PROVIDER_NAME = :smhi

  API_BASE_URI = 'http://opendata-download-metfcst.smhi.se/api/category/pmp1.5g/version/1/geopoint'

  # Get forecasts from SMHI webservice
  # @param location Weathervane::Location
  # @param location Weathervane::Provider
  # @return array
  def self.get_forecasts(location, provider = Weathervane::Provider.find_or_create_by(name: "SMHI"))

    forecasts = []

    response = Net::HTTP.get_response(
        self.uri_template.expand(
            lat: location.lat,
            lon: location.lng
        )
    )

    if response.is_a?(Net::HTTPSuccess)
      json = JSON.parse(response.body)
      json['timeseries'].each do |t|
        t[:issued_at] = json['referenceTime']
        forecasts << self.create_from_provider_response(location, provider, t)
      end
    end

    return forecasts

  end

  # Convert response from SMHI to Weathervane::Forecast
  # @param location Weathervane::Location
  # @param provider Weathervane::Provider
  # @param response Hash
  # @return Weathervane::Forecasts::Smhi
  def self.create_from_provider_response( location, provider, response )

    valid_until = Time.iso8601(response.try(:[],"validTime"))

    self.create!({
        valid_from: valid_until - 1.hour,
        valid_until: valid_until,
        issued_at: response.try(:[], :issued_at),
        speed: response.try(:[], 'ws'),
        gust: response.try(:[], 'gust'),
        direction: response.try(:[], 'wd'),
        temperature:  response.try(:[], 't'),
        pressure: response.try(:[], 'msl'),
        provider: provider,
        location: location
     })

  end

  def self.uri_template
    Addressable::Template.new("#{API_BASE_URI}/lat/{?lat}/lon/{?lon}/data.json")
  end

end
