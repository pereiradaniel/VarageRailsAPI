class AddIndexTablesForCategoriesItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :category_id
  	remove_column :items, :status_id
  	
  	create_table :categories_items, id: false do |t|
  		t.belongs_to :categories, index: true
  		t.belongs_to :item, index: true
  	end
  end
end
