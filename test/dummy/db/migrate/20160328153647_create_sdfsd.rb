class CreateSdfsd < ActiveRecord::Migration
	 def change
		create_table :sdfsd do |t|
			 t.integer :hh
			 t.timestamps 
		 end 
	 end 
end 
