class CreateAb < ActiveRecord::Migration
	 def change
		create_table :ab do |t|
			 t.integer :aa
			 t.integer :bbb
			 t.timestamps 
		 end 
	 end 
end 
