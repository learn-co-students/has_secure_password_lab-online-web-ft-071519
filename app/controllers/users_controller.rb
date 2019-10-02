class UsersController < ApplicationController
  def home
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path
      else
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
