class CreateBanana < ActiveRecord::Migration
	 def change
		create_table :banana do |t|
			 t.integer :name
			 t.timestamps 
		 end 
	 end 
end 
