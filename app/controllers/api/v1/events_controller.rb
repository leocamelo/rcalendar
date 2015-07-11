class Api::V1::EventsController < ApplicationController

  # GET /api/v1/events
  def index
    @events = Event.all
    respond_to do |format|
      format.json { render json: @events, status: 200 }
    end
  end

  # POST /api/v1/events
  def create
    respond_to do |format|
      format.json do
        @event = Event.new(event_params)
        if @event.save
          render json: @event
        else
          render json: @event.errors
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
