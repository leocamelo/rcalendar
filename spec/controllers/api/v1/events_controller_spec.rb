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

    context 'with valid params' do
      before { post :create, format: :json, event: attributes_for(:event) }
      subject { assigns(:event) }

      it 'create a new event' do
        expect(Event.count).to eq(1)
      end

      it 'responds with HTTP 201 status code' do
        expect(response).to have_http_status(201)
      end

      it 'assign created event into @event' do
        expect(subject).to eq(Event.last)
      end

      it 'render @event in json format' do
        expect(response.body).to eq(subject.to_json)
      end
    end

    context 'with invalid params' do
      before { post :create, format: :json, event: { title: 'Not valid event' } }
      subject { assigns(:event) }

      it "don't create a event" do
        expect(Event.all).to be_empty
      end

      it 'responds with HTTP 422 status code' do
        expect(response).to have_http_status(422)
      end

      it 'render @event.errors in json format' do
        expect(response.body).to eq(subject.errors.to_json)
      end
    end

  end

end
