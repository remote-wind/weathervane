require 'factory_girl'

module Weathervane

  module Seeds

    class Providers

      def self.seed *args
        Weathervane::Providers::SMHI.create(
            name: 'SMHI'
        )
      end

    end
  end

end