module Admin

    class EventsController < AdminController
      before_action :is_site_admin?
  
      def index
        @events = Event.order(:id)
      end
  
      def new
        @event = Event.new
      end
  
      def show
        @event = Event.find(params:[:id])
      end
  
      def edit
        puts "#"*100
        puts params[:id].to_i
        puts "#"*100
        @event = Event.find(params[:id])
      end
  
      def update
        @event = Event.find(params[:id])
          if @event.update!(event_params)
            flash[:success] = "L\'évènement a bien été mis à jour."
            redirect_to admin_events_path
          else
            flash[:warning] = "Something went wrong"
            render 'edit'
          end
      end
      
      def destroy
        @event = Event.find(params[:id])
        if @event.destroy
          flash[:success] = 'L\'évènement a bien été supprimé.'
          redirect_to admin_events_path
        else
          flash[:warning] = 'Something went wrong'
          redirect_to admin_events_path
        end
      end
  
      private
  
      def event_params
        params.require(:event).permit(:title, :location, :description, :start_date, :duration, :price)
      end
    
      def is_site_admin?
        unless user_signed_in? && current_user.site_admin
          flash[:danger] = 'Vous n\'avez pas la permission d\'accéder à cette page'
          redirect_to root_path
        end
      end
    end
  end
  