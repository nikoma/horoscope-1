class AddIndexToForecasts < ActiveRecord::Migration
  def change
    add_index :forecasts, :id_zd
    add_index :forecasts, :dt
  end
end
