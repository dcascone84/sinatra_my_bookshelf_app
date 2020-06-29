require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] 
  end

  get '/' do
      erb :welcome
  end

  helpers do
    
    def logged_in?
      # true else false
      !!current_user
    end

    def current_user
      # energy saver so multiple db call arent made. 
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end
end
