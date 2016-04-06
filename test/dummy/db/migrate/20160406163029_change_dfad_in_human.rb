class ChangeDfadInHuman <ActiveRecord::Migration
	def change
		change_column :human, :dfad, :integer
		rename_column :human, :dfad, :dfaddd
	end
end
