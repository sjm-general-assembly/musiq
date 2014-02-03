class UsersController < ApplicationController
	# allow only signed in users to edit/update profile
  # before_filter :signed_in_user, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
  end

  def create
    new_user = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user=User.new(new_user)
    if @user.save
      flash[:success] = "Welcome to Ritly!"
      sign_in @user
      redirect_to @user
    else
      render'new'
    end
  end

  # Not used (but could provide update functionality)
  # def update
  #   @user = User.find(params[:id])
  #   @user.update_attributes(params[:user])
  #   render :show
  # end
end
