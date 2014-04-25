class Provider
  include Mongoid::Document
  include Mongoid::Slug

  # Fields
  field :name, type: String
  slug :slug, history: false

  # Virtual atttributes
  attr_accessor :slug

  # Validations
  validates_uniqueness_of :name

  # Relations
  has_many :forecasts, class_name: 'Forecast'

  SERVICES = {}

  # Get available services for class such as forecasts and observations
  # Each key is  a reference to the class which can be used to fetch the resource
  # @return Hash
  def self.services
    self::SERVICES
  end

  # Get available services for instance such as forecasts and observations
  # Each key is  a reference to the class which can be used to fetch the resource
  # @return Hash
  def services
    SERVICES
  end

  # @abstract
  # @return hash - attributes used to create unique provider
  def self.attributes_for
    raise Weathervane::Errors::NotImplementedError,
          "#{self.name} must implement the class method attributes_for"
  end

  # Override create method for subclasses
  # Overrides ActiveModel::Model.create to use attributes from self.attributes_for
  def self.create(attributes = nil, options = {}, &block)
    begin
      super(self.attributes_for)
    rescue Weathervane::Errors::NotImplementedError => e
      super(attributes) if e.message == "#{self.name} must implement the class method attributes_for"
    end
  end

  # Override create method for subclasses
  # Overrides ActiveModel::Model.new to use attributes from self.attributes_for
  def self.new(attributes = nil)
    begin
      super(self.attributes_for)
    rescue Weathervane::Errors::NotImplementedError => e
      super(attributes) if e.message == "#{self.name} must implement the class method attributes_for"
    end
  end

end