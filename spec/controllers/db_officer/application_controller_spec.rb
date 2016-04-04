require 'rails_helper'

module DbOfficer
  RSpec.describe ApplicationController, type: :controller do
    routes { DbOfficer::Engine.routes }

    describe "tables" do
      it "returns array of all tables" do
        expect(subject.tables).to match_array(Table.app_tables)
      end
    end
  end
end
