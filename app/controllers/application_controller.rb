require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "19ZlhdXk10HUjInPwxn6NErhTrlygQzKR9h6OFA8bnz96h6CSf1yv10Aqk5lnsyO4SKCn7pYG0K8pCMxC3AWptg" 
  end

  helpers do
    
    def logged_in?
      # true else false
      !!current_user
    end

    def current_user
      # energey saver so multiple db call arent made. 
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end
end
