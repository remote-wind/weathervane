class Weathervane::Providers::SMHI < Weathervane::Provider

  SERVICES = {
      forecasts: Weathervane::Forecasts::SMHI
  }

  def self.attributes_for
    {
        name: "Swedish Metrological and Hydrological Institure",
        slug: "smhi"
    }
  end

end
