require 'rails_helper'

module DbOfficer
  RSpec.describe Table, type: :model do
    describe 'Check validation' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
