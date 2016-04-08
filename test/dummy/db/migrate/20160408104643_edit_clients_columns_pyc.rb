class EditClientsColumnsPyc <ActiveRecord::Migration
	def change
		add_column :clients, :test_client, :text
	end
end
