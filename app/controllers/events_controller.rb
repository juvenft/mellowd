class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events/my_events
  def my_events
    @user = current_user
    @applied_events = current_user.events
    @created_events = current_user.bookings.includes(:event).map(&:event)
    authorize @event
  end

  # GET /events
  def index
    @events = Events.all
    @markers = @events.geocoded.map doo |event|
    {
      lat: event.latitude,
      lng: event.longitude,
      info_window_html:
  render_to_string(partial: "info_window", locals: {event: event})
    }
  end

  # GET /events/1
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    authorize @event
    redirect_to events_url, notice: "Event was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :date, :duration, :genre, :address, :time, :user_id)
    end
end
