class CreateTimer < ActiveRecord::Migration
def change
  create_table :timer do |t|
    t.text :tt
    t.timestamps
  end
end
end