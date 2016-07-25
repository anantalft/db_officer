class CreateAaa < ActiveRecord::Migration
	 def change
		create_table :aaa do |t|
			 t.integer :bbb
			 t.integer :ccc
			 t.integer :dddd
			 t.timestamps 
		 end 
	 end 
end 
