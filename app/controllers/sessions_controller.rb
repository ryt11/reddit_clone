class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
       session[:user_id] = user.id
       #when user authenticates it finds by uid, unless updated_at > hour
       #if that is true then we make a call to reddit API to update the token
    end
    redirect_to root_path
  end
end
