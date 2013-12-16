class CreateWeathervaneForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.datetime    :valid_from
      t.datetime    :valid_until
      t.datetime    :reference_time
      t.string      :forecast_provider_name
      t.float       :latitude
      t.float       :longitude
      t.float       :wind_direction
      t.float       :wind_speed
      t.float       :wind_gust
      t.belongs_to  :forecast_provider
      t.timestamps
    end
    add_index :forecasts, :forecast_provider_id
    add_index :forecasts, :forecast_provider_name
  end
end
