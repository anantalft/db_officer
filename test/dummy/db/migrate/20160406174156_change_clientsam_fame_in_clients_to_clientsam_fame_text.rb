class ChangeClientsamFameInClientsToClientsamFameText <ActiveRecord::Migration
	def change
		change_column :clients, :clientsam_fame, :text
		rename_column :clients, :clientsam_fame, :clientsam_fame
	end
end
