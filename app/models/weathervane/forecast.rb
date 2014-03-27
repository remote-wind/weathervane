class Weathervane::Forecast
  include Mongoid::Document
  include Mongoid::Timestamps::Created # Adds created_at field

  belongs_to :provider
  embeds_one :place

  field :valid_from, type: Time
  field :valid_until, type: Time
  field :issued_at, type: Time
  field :speed, type: Float # M/S
  field :gust, type: Float # M/S
  field :direction, type: Float # degrees
  field :temperature, type: Float # degrees centigrade
  field :pressure, type: Float # hPa

  validates_numericality_of :speed, :gust, :temperature, :pressure, allow_nil: true
  validates :direction, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360, allow_nil: true}

end