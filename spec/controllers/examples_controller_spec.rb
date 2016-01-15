require 'rails_helper'

RSpec.describe ExamplesController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'responds with HTTP 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
