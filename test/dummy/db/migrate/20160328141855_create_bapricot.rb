class CreateBapricot < ActiveRecord::Migration
	 def change
		create_table :bapricot do |t|
			 t.integer :name
			 t.timestamps 
		 end 
	 end 
end 
