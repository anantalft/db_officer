require 'rails_helper'

module DbOfficer
  RSpec.describe TablesController, type: :controller do
      describe "POST #create" do
        context "with valid attributes" do
          it "creates a new table" do
          end
          it "redirects to db_office#main" do
          end
        end
        context "with invalid attributes" do
          it "does not create the new table" do
          end
          it "re-renders the :new template" do
          end
        end
      end
      describe 'GET #new' do
        it "assigns a new Table to @table" do
        end
        it "renders the :new template" do
        end
      end
  end
end
