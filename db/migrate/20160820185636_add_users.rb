class AddUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.timestamps
  		t.string :name
  		t.string :password_digest
  		t.string :token
  		t.float	 :latitude
  		t.float	 :longitude
  	end
  	add_index :users, :token, unique: true
  end
end
