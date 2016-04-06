class ChangeAbbInBarticles <ActiveRecord::Migration
	def change
		change_column :barticles, :abb, :integer
		rename_column :barticles, :abb, :fgf
	end
end
