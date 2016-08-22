class AddCategories < ActiveRecord::Migration[5.0]
  def change
  	create_table :categories do |t|
  		t.timestamps
  		t.string	:category_name
  	end
  end
end