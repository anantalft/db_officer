require 'rails_helper'

module DbOfficer
  RSpec.describe TableColumn, type: :model do
    describe "Check validation" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:field_type) }
    end
  end
end
