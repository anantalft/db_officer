class CreateDustomers < ActiveRecord::Migration
	 def change
		create_table :dustomers do |t|
			 t.integer :abc
			 t.integer :bbc
			 t.integer :ccb
			 t.timestamps 
		 end 
	 end 
end 
