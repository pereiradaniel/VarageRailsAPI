class AddStatuses < ActiveRecord::Migration[5.0]
  def change
  	create_table :statuses do |t|
  		t.timestamps
  		t.string :status_name
  	end
  end
end
