require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do

  describe 'GET #index' do
    before { get :index, format: :json }
  end

  describe 'POST #create' do
  end

end
