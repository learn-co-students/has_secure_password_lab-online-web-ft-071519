class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def new
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end

