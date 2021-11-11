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
    @event = Event.new(
      title: params[:title],
      description: params[:description],
      duration: params[:duration],
      start_date: params[:start_date],
      price: params[:price],
      location: params[:location],
      admin: current_user,
      event_picture: params[:event_picture]
      )
    if params.has_key?('event_picture')
      if params[:event_picture].content_type.start_with?('image')
        if @event.save
          @event.event_picture.attach(params[:event_picture])
          redirect_to event_path(@event)
        else
          flash[:warning] = 'Il y eu un problème lors de l\'enregistrement'
        end
      else
        flash[:warning] = 'Le fichier transmis ne correspond pas à une image'
      end
    else
      flash[:info] = 'La photo de l\'évènement est obligatoire'
    end
    redirect_to new_event_path
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
    params.require(:event_picture).permit(:title, :description, :duration, :start_date, :price, :location, :event_picture)
  end

  def is_event_admin?
    unless current_user == Event.find(params[:id]).admin
      flash[:warning] = "Vous n'avez pas accès à cette page"
      redirect_to events_path 
    end
  end

  def is_event_picture_attached?
    begin
      unless params[:event_picture].content_type.start_with?('image')
        flash[:warning] = "Le fichier n'est pas une image"
        redirect_to new_event_path
      end
    rescue
      flash[:warning] = "Aucun fichier n'a été chargé"
      redirect_to new_event_path
    end
  end
end