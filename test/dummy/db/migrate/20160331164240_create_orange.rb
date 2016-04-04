class CreateOrange < ActiveRecord::Migration
	 def change
		create_table :orange do |t|
			 t.integer :tyoe
			 t.timestamps 
		 end 
	 end 
end 
