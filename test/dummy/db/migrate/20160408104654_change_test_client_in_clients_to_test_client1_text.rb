class ChangeTestClientInClientsToTestClient1Text <ActiveRecord::Migration
	def change
		change_column :clients, :test_client, :text
		rename_column :clients, :test_client, :test_client1
	end
end
