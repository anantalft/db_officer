class RemoveBbbFromAb <ActiveRecord::Migration
	def change
		remove_column :ab, :bbb
	end
end
