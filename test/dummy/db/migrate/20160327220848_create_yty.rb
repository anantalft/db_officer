class CreateYty < ActiveRecord::Migration
	 def change
		create_table :yty do |t|
			 t.integer :yuu
			 t.timestamps 
		 end 
	 end 
end 
