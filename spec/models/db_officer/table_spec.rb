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

    describe "#create_migration_file" do
      it "create migration file for the table" do
        file = Generator.file_name_for_create(table.name)
        path = Rails.root.join('test/test_files') + file
        table.create_migration_file(path)
        expect(File.exist?(path)).to be_truthy
      end
    end

    describe "record_already_exists?" do
      it 'validates that record is unique' do
        t2 = build(:table, name: 'human')
        t2.valid?
        expect(t2.errors[:name].size).to eq(0)
      end
    end

    describe "check presence of table columns" do
      it "validate if table coloumn is empty" do
        t3 = build(:table, name: 'human')
        expect(t3.errors[:table_columns].size).to eq(0)
      end
    end

  end

end
