class RemoveAndAddColumnInForecasts < ActiveRecord::Migration
  def change
    remove_column :forecasts, :text
    add_column :forecasts, :text, :text
  end
end
