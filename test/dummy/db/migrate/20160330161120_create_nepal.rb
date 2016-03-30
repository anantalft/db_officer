class CreateNepal < ActiveRecord::Migration
	 def change
		create_table :nepal do |t|
			 t.integer :state
			 t.string :country
			 t.timestamps 
		 end 
	 end 
end 
