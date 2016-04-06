class ChangeClientsNamFamInClients <ActiveRecord::Migration
	def change
		change_column :clients, :clients_nam_fam, :text
		rename_column :clients, :clients_nam_fam, :clientsam_fam
	end
end
