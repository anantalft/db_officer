require 'rails_helper'

module DbOfficer
  RSpec.describe Table, type: :model do

    let(:table) { build(:table) }

    describe "Check validation" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:table_columns) }
    end

    describe ".column_types" do
      it 'returns array of all column type' do
        expect(Table.column_types).to match_array([
        ["INTEGER", "integer"],
        ["STRING", "string"],
        ["TEXT", "text"],
        ["DATETIME", "datetime"],
        ["FLOAT", "float"],
        ["BOOLEAN", "boolean"],
        ])
      end
    end

    describe ".app_tables" do
      it "returns all the table in the application" do
        expect(Table.app_tables).to match_array(ActiveRecord::Base.connection.tables)
      end
    end

    describe ".app_table_columns" do
      it "returns all the columns in the table" do
        db_table = Table.app_tables[0]
        expect(Table.app_table_columns(db_table)[0].name).to eql(ActiveRecord::Base.connection.columns(db_table)[0].name)
      end
    end
  end
end
