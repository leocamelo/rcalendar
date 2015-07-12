require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe 'GET #index' do
    before { get :index, format: :json }
    subject { assigns :events }

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
    subject { assigns :event }

    context 'with valid params' do
      before { post :create, format: :json, event: attributes_for(:event) }

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

      it 'not created an event' do
        expect(Event.all).to be_empty
      end

      it 'responds with HTTP 422 status code' do
        expect(response).to have_http_status(422)
      end

      it 'render @event.errors in json format' do
        errors = { errors: subject.errors }
        expect(response.body).to eq(errors.to_json)
      end
    end

  end

  describe 'PATCH #update' do

    context 'when event exists' do
      let :event do
        create(:event)
      end
      before do
        patch :update, format: :json, id: event.id, event: params
      end
      subject { assigns :event }

      context 'with valid params' do
        let :params do
          { title: "Hilde's birthday" }
        end

        it 'change the event attributes' do
          expect(subject.title).to eq(params[:title])
        end

        it 'responds with HTTP 204 status code' do
          expect(response).to have_http_status(204)
        end

        it 'assign updated event into @event' do
          expect(subject).to eq(event)
        end
      end

      context 'with invalid params' do
        let :params do
          { title: nil }
        end

        it 'not updated the event' do
          expect(subject.title).to_not eq(event.title)
        end

        it 'responds with HTTP 422 status code' do
          expect(response).to have_http_status(422)
        end

        it 'render @event.errors in json format' do
          errors = { errors: subject.errors }
          expect(response.body).to eq(errors.to_json)
        end
      end

    end

    context 'then event not exists' do
      before do
        patch :update, format: :json, id: 0
      end

      it 'responds with HTTP 404 status code' do
        expect(response).to have_http_status(404)
      end

      it 'render not found message in json format' do
        message = { error: :not_found }.to_json
        expect(response.body).to eq(message)
      end
    end

  end

end
