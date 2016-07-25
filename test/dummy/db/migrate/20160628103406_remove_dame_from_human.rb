class RemoveDameFromHuman <ActiveRecord::Migration
	def change
		remove_column :human, :dame
	end
end
