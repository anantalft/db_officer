class CreateApril6 < ActiveRecord::Migration
	 def change
		create_table :april6 do |t|
			 t.integer :abb
			 t.datetime :bbb
			 t.text :ccc
			 t.timestamps 
		 end 
	 end 
end 
