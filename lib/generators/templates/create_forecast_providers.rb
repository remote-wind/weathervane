class CreateForecastProvider < ActiveRecord::Migration
  def change
    create_table :forecast_providers do |t|
      t.string :name
    end
    add_index :forecast_providers, :name, unique: true
  end
end