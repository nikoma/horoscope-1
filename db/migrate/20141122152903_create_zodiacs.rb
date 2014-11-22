class CreateZodiacs < ActiveRecord::Migration
  def change
    create_table :zodiacs do |t|
      t.integer :id_zd 
      t.string :name
      t.string :begin_dt
      t.string :end_dt
      
      t.timestamps
    end
    
    add_index :zodiacs, :id_zd
    add_index :zodiacs, :name
  end
end

#i = Zodiac.new(id_zd: 7, name: "libra", begin_dt: "2014-09-24", end_dt: "2014-10-23")