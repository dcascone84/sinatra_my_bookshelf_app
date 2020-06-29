class SessionsController < ApplicationController
    
    # this route will render my login page(form)
    get '/login' do
        erb :'/sessions/login'
    end

    # this route will receive the login form, find the user and log them in (creates session)
    # make sure form fields are not blanks strings
    # find the user in the db
    # authenticate the user -verify the user is who they say they are by email/password combo
    # login the user(creates session)
    # redirect the user to their landing page
    post '/login' do
        if params[:name] != "" && params[:email] != ""
            @user = User.find_by(email: params[:email])
            if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
            else
                erb :'/sessions/login'
            end
        else
            erb :'/sessions/login'
        end
    end

    # routes for signup
    # this route will render the signup form
    get '/signup' do
       erb :'/sessions/signup'
    end

    # params looks like: {"username"=>"Isabella", "email"=>"isabella@email.com",
    # "password"=>"password"}
    # a user should on be persisted if they have all three only name, email, and password 
    post '/signup' do
        if params[:name] != "" && params[:email] != "" && params[:password] != "" 
            @user = User.new(name: params[:name], email: params[:email], password: params[:password])
            if @user.save
                session[:user_id] = @user.id
                redirect "/users/#{@user.id}"
            else
                erb :'/sessions/signup'
            end
        else
            erb :'/sessions/signup'
        end
    end

     # user logout route
     get '/logout' do
        session.clear
        redirect "/"
    end

end