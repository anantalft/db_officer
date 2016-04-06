class CreateBarticles < ActiveRecord::Migration
	 def change
		create_table :barticles do |t|
			 t.integer :abb
			 t.integer :bb
			 t.timestamps 
		 end 
	 end 
end 
