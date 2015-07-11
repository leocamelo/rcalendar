require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe 'GET #index' do
    before { get :index, format: :json }
    subject { assigns(:events) }

    it 'responds with HTTP 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'assigns all events into @events' do
      sofias_bday = create(:event)
      hildes_bday = create(:event, title: "Hilde's birthday")
      events = [sofias_bday, hildes_bday]
      get :index, format: :json
      expect(subject).to match_array(events)
    end

    it 'render @events in json format' do
      expect(response.body).to eq(subject.to_json)
    end
  end

  describe 'POST #create' do
  end

end
