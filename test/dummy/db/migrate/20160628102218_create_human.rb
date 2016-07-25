class CreateHuman < ActiveRecord::Migration
	 def change
		create_table :human do |t|
			 t.integer :name
			 t.integer :fame
			 t.timestamps 
		 end 
	 end 
end 
