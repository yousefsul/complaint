class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'Sign Up Successfully' }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :new, errors: @user.errors.full_messages, status: :unprocessable_entity }
        format.json { render json: @user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end