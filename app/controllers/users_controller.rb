class UsersController < ApplicationController

def new 
end 

def create 
@user = User.new(user_params)
 if !@user.save
    redirect_to '/users/new'
 else
    session[:user_id] = @user.id
    redirect_to "/"
 end
end 

def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
end 

end 