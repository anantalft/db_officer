class ChangeIdInCarticlesSarticelsNm <ActiveRecord::Migration
	def change
		change_column :carticles_sarticels_nm, :id, :integer
		rename_column :carticles_sarticels_nm, :id, :id
	end
end
