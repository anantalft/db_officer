class CreateHuman < ActiveRecord::Migration
	 def change
		create_table :human do |t|
			 t.integer :fsd
			 t.integer :dfad
			 t.integer :dfasd
			 t.timestamps 
		 end 
	 end 
end 
