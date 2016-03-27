class CreateHumor < ActiveRecord::Migration
	 def change
		create_table :humor do |t|
			 t.integer :tile
			 t.integer :file
			 t.integer :jile
			 t.integer :hile
			 t.integer :kile
			 t.integer :lile
			 t.timestamps 
		 end 
	 end 
end 
