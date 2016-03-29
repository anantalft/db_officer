class CreateRampyari < ActiveRecord::Migration
	 def change
		create_table :rampyari do |t|
			 t.integer :name
			 t.string :fame
			 t.timestamps 
		 end 
	 end 
end 
