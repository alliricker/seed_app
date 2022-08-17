class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :logged_in?, :current_user 
  
    private
    
    def current_user
      @user = User.find_by(id: session[:user_id]) || User.new
    end

    def current_user?(user)
      user == current_user 
    end

    def logged_in?
      current_user.id!= nil 
    end

    def require_logged_in 
      return redirect_to root_path unless logged_in?
    end



end
