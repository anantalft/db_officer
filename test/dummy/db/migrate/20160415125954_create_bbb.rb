class CreateBbb < ActiveRecord::Migration
	 def change
		create_table :bbb do |t|
			 t.integer :cc
			 t.integer :ddd
			 t.integer :eee
			 t.timestamps 
		 end 
	 end 
end 
