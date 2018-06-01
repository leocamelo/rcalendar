module V1
  class EventsController < BaseController
    def index
      date_query = params.permit(:year, :month, :day)
      @events = Event.by_date(date_query).order(:started_at)
      respond_with @events
    end

    def create
      @event = Event.create(event_params)
      @event.alert = t('.conflicted') if @event.has_conflicted_event?
      respond_with @event, location: nil
    end

    def update
      @event = Event.find_by(id: params[:id])
      if @event.present?
        @event.update(event_params)
        respond_with @event
      else
        render json: { error: :not_found }, status: :not_found
      end
    end

    private

    def event_params
      params.require(:event).permit(:title, :description, :location,
                                    :started_at, :ended_at, :all_day)
    end
  end
end

