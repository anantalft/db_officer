class CreateRer < ActiveRecord::Migration
	 def change
		create_table :rer do |t|
			 t.integer :ee
			 t.timestamps 
		 end 
	 end 
end 
