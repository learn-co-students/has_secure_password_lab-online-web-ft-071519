class UsersController < ApplicationController
    def create
        binding.pry
        redirect_to new_user_url if params[:user][:password_confirmation] != params[:user][:password]
 
 @user = User.create(user_params)
       
        session[:user_id] = @user.id
    end
     
    def new

    end
private
     
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end