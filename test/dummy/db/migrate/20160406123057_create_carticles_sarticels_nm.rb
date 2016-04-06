class CreateCarticlesSarticelsNm < ActiveRecord::Migration
	 def change
		create_table :carticles_sarticels_nm do |t|
			 t.integer :aaa
			 t.integer :bb
			 t.integer :ccc
			 t.timestamps 
		 end 
	 end 
end 
