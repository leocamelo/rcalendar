class Api::V1::EventsController < ApplicationController

  # for public api
  skip_before_filter :verify_authenticity_token

  # GET /api/v1/events
  def index
    respond_to do |format|
      format.json do
        @events = Event.all
        render json: @events, status: :ok #200
      end
    end
  end

  # POST /api/v1/events
  def create
    respond_to do |format|
      format.json do
        @event = Event.new(event_params)
        if @event.save
          render json: @event, status: :created #201
        else
          render json: @event.errors, status: :unprocessable_entity #422
        end
      end
    end
  end

  private

  # strong parameters for event model
  def event_params
    params.require(:event).permit(:title, :description, :location,
    :start_date, :start_time, :end_date, :end_time, :all_day)
  end

end
