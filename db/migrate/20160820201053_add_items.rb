class AddItems < ActiveRecord::Migration[5.0]
  def change
  	create_table :items do |t|
  		t.timestamps
  		t.string 	:title
  		t.text	 	:description
  		t.integer :price
  		t.integer :user_id
  		t.integer :status_id
  	end
  end
end
