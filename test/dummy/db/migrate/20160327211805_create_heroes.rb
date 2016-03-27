class CreateHeroes < ActiveRecord::Migration
	def change
		create_table :heroes do |t|
				 t.integer :timber
				 t.timestamps 
		 end 
	 end 
end 
