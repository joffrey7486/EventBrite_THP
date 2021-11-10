class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :is_event_admin?, only: [:edit, :update, :destroy]

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
      start_date: params[:start_date],
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_attendances_path(@event)
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:info] = "Votre évènement a bien été supprimé !"
    redirect_to :root
  end

  private 

  def event_params
    params.require(:event).permit(:title, :description, :duration, :start_date, :price, :location)
  end

  def is_event_admin?
    unless current_user == Event.find(params[:id]).admin
      flash[:warning] = "Vous n'avez pas accès à cette page"
      redirect_to events_path 
    end
  end
end
