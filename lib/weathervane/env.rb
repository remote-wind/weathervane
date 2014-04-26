module Weathervane

  # String extension
  module EnviromentalVar

    # Use YAML syntax rules to convert string to boolean
    def to_bool
      YAML.load(self) unless self.nil?
    end

    def or default
      return default if self.nil?
      self.to_bool if default.is_a?(Boolean)
      self
    end

  end

  class Env

    # Injectable so we can test without mucking with ENV
    @@vars = ENV

    class << self
      attr_accessor :vars
      # When fetching a var with square bracket "syntax"
      def [] key
        vars = self.vars || ENV
        var = vars[key.to_s]
        # handle immutable string
        var = String.new(var) unless var.nil?
        var.extend(Weathervane::EnviromentalVar)
      end
    end

  end

end