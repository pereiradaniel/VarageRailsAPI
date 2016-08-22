class AddIndexTablesForCategoriesItems < ActiveRecord::Migration[5.0]
  def change
  	create_table :categories_items, id: false do |t|
  		t.belongs_to :category, index: true
  		t.belongs_to :item, index: true
  	end
  end
end
