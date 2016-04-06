class CreateApril62 < ActiveRecord::Migration
	 def change
		create_table :april62 do |t|
			 t.boolean :rrr
			 t.float :ssss
			 t.text :tttt
			 t.timestamps 
		 end 
	 end 
end 
