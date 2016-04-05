require 'rails_helper'

module DbOfficer
  RSpec.describe MainController, type: :controller do
    routes { DbOfficer::Engine.routes }
    describe 'GET #index' do
      it 'populates an array of all tables' do
        get :index
        expect(assigns(:tables)).to match_array(Table.app_tables)
      end
      it 'populates an array of columns of selected table' do
        get :index,table_name: Table.app_tables[0]
        expect(assigns(:columns)).to match_array(Table.app_table_columns(Table.app_tables[0]))
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template 'db_officer/main/index'
      end
    end

  end
end
