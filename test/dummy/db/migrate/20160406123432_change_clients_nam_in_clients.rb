class ChangeClientsNamInClients <ActiveRecord::Migration
	def change
		change_column :clients, :clients_nam, :text
		rename_column :clients, :clients_nam, :clients_nam_fam
	end
end
