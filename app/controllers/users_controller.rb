class UsersController < ApplicationController

  def show
  end

  # GET /users/new
  # action for the new route
  def new
    @user = User.new
  end

  # USER /users or /users.json
  # action when post to the new route
  # save the user id in the session as id
  # create user and redirect to home page
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  # define the parameters for the user
  # require for the user params and raise error for any missing
  # permit list of the parameters
  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end



