
class SessionsController < ApplicationController

    def new
        @user = User.new 
    end

    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, there was an error with your login"
            redirect_to "/signin"
            end
        end


    def destroy 
        session.delete :user_id 
        redirect_to root_path
    end

end