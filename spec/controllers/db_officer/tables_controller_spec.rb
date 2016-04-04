require 'rails_helper'

module DbOfficer
  RSpec.describe TablesController, type: :controller do
    routes { DbOfficer::Engine.routes }
    let(:table) { build(:table) }
      describe "POST #create" do
        context "with valid attributes" do
          it "generate the script and creates a new table" do

          end
          it "redirects to main#index" do
            # post :create,table: table
            # expect(response).to redirect_to main_index_path
          end
        end
        context "with invalid attributes" do
          it "does not create the new table" do
            post :create, table: attributes_for(:table)
            expect(response).to render_template :new
          end
          it "re-renders the :new template" do
            post :create, table: attributes_for(:table)
            expect(response).to render_template :new
          end
        end
      end
      describe 'GET #new' do
        it "assigns a new Table to @table" do
          get :new
          expect(assigns(:table)).to be_kind_of(Table)
        end
        it "renders the :new template" do
          get :new
          expect(response).to render_template :new
        end
      end
  end
end
