class AddIndexTablesForItemsStatuses < ActiveRecord::Migration[5.0]
  def change
  	create_table :items_statuses, id: false do |t|
  		t.belongs_to :item, index: true
  		t.belongs_to :status, index: true
  	end
  end
end
