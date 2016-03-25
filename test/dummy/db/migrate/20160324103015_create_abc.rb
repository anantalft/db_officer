class CreateAbc < ActiveRecord::Migration
  def change
    create_table :abc do |t|
      t.integer :abc
      t.timestamps
    end
  end
end