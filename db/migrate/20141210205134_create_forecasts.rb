class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :id_zd 
      t.string :dt
      t.string :text

      t.timestamps
    end
  end
end
