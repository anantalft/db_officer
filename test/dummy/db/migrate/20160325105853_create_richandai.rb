class CreateRichandai < ActiveRecord::Migration
  def change
    create_table :richandai do |t|
      t.string :name
      t.timestamps
    end
  end
end