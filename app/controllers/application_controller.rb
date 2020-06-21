require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "19ZlhdXk10HUjInPwxn6NErhTrlygQzKR9h6OFA8bnz96h6CSf1yv10Aqk5lnsyO4SKCn7pYG0K8pCMxC3AWptg" 
  end

  get "/" do
    erb :welcome
  end

end
