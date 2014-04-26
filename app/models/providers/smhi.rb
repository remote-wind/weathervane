module Providers
  class SMHI < Provider
    SERVICES = {
        forecasts: Forecasts::SMHI
    }

    def self.attributes_for
      {
          name: "Swedish Metrological and Hydrological Institure",
          _slug: "smhi"
      }
    end
  end
end