class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id_zd 
      t.string :email
      t.string :dt_of_b
      t.string :password_digest
      
      t.timestamps
    end
  end
end
