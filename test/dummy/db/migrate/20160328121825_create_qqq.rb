class CreateQqq < ActiveRecord::Migration
	 def change
		create_table :qqq do |t|
			 t.integer :aa
			 t.integer :bbb
			 t.integer :ccc
			 t.integer :ddd
			 t.timestamps 
		 end 
	 end 
end 
