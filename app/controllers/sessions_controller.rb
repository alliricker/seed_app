
class SessionsController < ApplicationController

    def new
    end

    def create 
        user = @user = User.find_by(name: params[:user][:name])
        if user 
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            end
        end
    end


    def destroy 
        session.delete :user_id 
        redirect_to root_path
    end

end