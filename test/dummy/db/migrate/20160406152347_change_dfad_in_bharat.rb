class ChangeDfadInBharat <ActiveRecord::Migration
	def change
		change_column :bharat, :dfad, :integer
		rename_column :bharat, :dfad, :dfad
	end
end
