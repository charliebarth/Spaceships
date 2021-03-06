require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "spaceships"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  private
  def redirect_if_logged_out
    if !logged_in?
      redirect "/login"
    end
  end

  def redirect_if_not_authorized
    if current_user.id != @spaceship.user_id
      redirect "/spaceships"
    end
  end

end
