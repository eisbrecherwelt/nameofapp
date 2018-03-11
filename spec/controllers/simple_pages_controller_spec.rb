require 'rails_helper'

describe SimplePagesController, type: :controller do
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('landing_page')
    end
  end
end