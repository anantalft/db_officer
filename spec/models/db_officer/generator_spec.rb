require 'rails_helper'

module DbOfficer
  RSpec.describe Generator, type: :model do
    let(:table) { build(:table) }

    describe ".create_table_script" do
      it "generates a script to create a table " do
        temp = ""
        temp =  "class Create#{table.name.capitalize} < ActiveRecord::Migration\n"
        temp+=  "\t def change\n"
        temp+=  "\t\tcreate_table :#{table.name.downcase} do |t|\n"
        Array(table.table_columns).each do |table_column|
          temp+=  "\t\t\t t.#{table_column.field_type} :#{table_column.name}\n"
        end
        temp+=  "\t\t\t t.timestamps \n"
        temp+= "\t\t end \n"
        temp+= "\t end \n"
        temp+= "end \n"
       expect(Generator.create_table_script(table)).to eq(temp)
      end
    end
  end
end
