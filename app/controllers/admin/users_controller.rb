module Admin

  class UsersController < AdminController
    before_action :is_site_admin?

    def index
      @users = User.order(:id)
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params:[:id])
    end

    def edit
      puts "#"*100
      puts params[:id].to_i
      puts "#"*100
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
        if @user.update!(user_params)
          flash[:success] = "L\'utilisateur a bien été mis à jour."
          redirect_to admin_users_path
        else
          flash[:warning] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = 'L\'utilisateur a bien été supprimé.'
        redirect_to admin_users_path
      else
        flash[:warning] = 'Something went wrong'
        redirect_to admin_users_path
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :description, :site_admin)
    end
  
    def is_site_admin?
      unless user_signed_in? && current_user.site_admin
        flash[:danger] = 'Vous n\'avez pas la permission d\'accéder à cette page'
        redirect_to root_path
      end
    end
  end
end
