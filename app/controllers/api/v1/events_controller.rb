class Api::V1::EventsController < Api::V1::BaseController

  # GET /api/v1/events
  def index
    date_query = params.permit(:year, :month, :day)
    @events = Event.find_by_date(date_query)
    respond_with @events
  end

  # POST /api/v1/events
  def create
    @event = Event.create(event_params)
    @event.alert = t('.conflicted') if @event.has_conflicted_event?
    respond_with @event, location: nil
  end

  # PATCH /api/v1/events/:id
  def update
    if Event.exists? params[:id]
      @event = Event.find(params[:id])
      @event.update(event_params)
      respond_with @event
    else
      render json: { error: :not_found }, status: :not_found #404
    end
  end

  private

  # strong parameters for event model
  def event_params
    params.require(:event).permit(:title, :description,
    :location, :started_at, :ended_at, :all_day)
  end

end
