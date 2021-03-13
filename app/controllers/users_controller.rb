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
  # check if user input correct save user in database
  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    if @user.save
      format.html { redirect_to '/', notice: "User was successfully created." }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
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
    params.require(:user).permit(:email, :password)
  end
end
