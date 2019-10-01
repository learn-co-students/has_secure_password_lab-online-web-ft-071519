class SessionsController < ApplicationController

    #render log in form:
    def new
    end

    #catch params from login form, validate, and log the user in:
    def create
     #binding.pry 
      user = User.find_by(name: params[:user][:name])
      if user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id 
        @user = user
      else 
        redirect_to(controller: 'sessions', action: 'new')
      end
    end
end
