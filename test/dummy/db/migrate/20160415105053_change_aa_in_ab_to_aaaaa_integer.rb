class ChangeAaInAbToAaaaaInteger <ActiveRecord::Migration
	def change
		change_column :ab, :aa, :integer
		rename_column :ab, :aa, :aaaaa
	end
end
