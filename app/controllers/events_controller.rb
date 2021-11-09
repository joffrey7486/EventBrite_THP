class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    puts '#'*80
    puts params
    puts '#'*80

    @event = Event.new(
      title: params[:title],
      description: params[:description],
      duration: params[:duration],
      start_date: Date.strptime(params[:start_date], '%d/%m/%Y'),
      price: params[:price],
      location: params[:location],
      admin: current_user
    )
    if @event.save
      flash[:success] = "Evènement bien créé !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Il nous manque une ou plusieurs information(s)..."
      render 'new'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:event_suppress_success] = "Evènement bien supprimé !"
    redirect_to :root
  end
end

