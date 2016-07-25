require 'rails_helper'

module DbOfficer
  RSpec.describe TableColumn, type: :model do

    #https://gist.github.com/dmitriy-kiriyenko/1892874
    it_behaves_like "ActiveModel"

    describe "Check validation" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:field_type) }
      it { is_expected.to respond_to :_destroy }
    end
  end
end
