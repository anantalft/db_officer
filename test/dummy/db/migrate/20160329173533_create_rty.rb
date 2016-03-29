class CreateRty < ActiveRecord::Migration
	 def change
		create_table :rty do |t|
			 t.integer :dff
			 t.timestamps 
		 end 
	 end 
end 
