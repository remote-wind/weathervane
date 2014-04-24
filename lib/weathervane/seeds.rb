require 'factory_girl'


module Weathervane

  module Seeds

    class Factory

      def self.class_name
        self.name.demodulize.singularize.downcase.to_sym
      end

      def self.create(n = 10)
        n.times do
          FactoryGirl.create(class_name)
        end
      end
    end

    class Providers < Seeds::Factory
    end

    class Forecasts < Seeds::Factory
    end

  end

end