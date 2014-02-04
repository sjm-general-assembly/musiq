class UsersController < ApplicationController
	# allow only signed in users to edit/update profile
  # before_filter :signed_in_user, only: [:update]

  # GETs a form to show user profile
  def show
    @user = User.find(params[:id])
  end

  # GETs a form to edit user profile
  def edit
    @user = User.find(params[:id])
  end

  # GETs a form to create a new user
  def new
    @user = User.new()
  end

  # POSTs the results from new, creating a new user
  def create
    new_user = params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    new_user[:role] = 'listener'  # hard code role for now
    @user = User.new(new_user)
    if @user.save
      flash[:success] = "Welcome to MusiQ!"
      sign_in @user
      redirect_to root_url
    else
      render'new'
    end
  end

  # DELETE destroy the current user
  def destroy
    user = User.find(params[:id])
    sign_out
    user.destroy      
    redirect_to root_url
  end


end
