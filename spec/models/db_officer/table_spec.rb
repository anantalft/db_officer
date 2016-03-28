require 'rails_helper'

module DbOfficer
  RSpec.describe Table, type: :model do
    describe 'Check validation' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe '.column_types' do
      it 'return array of all column type' do
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
  end
end
