class UsersController < ApplicationController
    
    # routes for login
    # this route will render my login page(form)
    get '/login' do
        erb :login
    end

    # this route will receive the login form, find the user and log them in (creates session)
    post '/login' do
        # params looks like: {"email"=>"user@gmail.com", "password"=>"password"}
        # find the user
        @user = User.find_by(email: params[:email])
        # authenticate the user -verify the user is who they say they are by email/password combo
        if @user.authenticate(params[:password])
        # login the user(creates session) 
           session[:user_id] = @user.id
        # redirect the user to their landing page (show, index)
        redirect "/user/#{@user.id}"
        else
            # tell the user incorrect email and/or password and redirect them to login
        end
    end

    # routes for signup
    # this route will render the signup form
    get '/signup' do
       erb :signup 
    end

    post '/users' do
        # params looks like: {"username"=>"Isabella", "email"=>"isabella@email.com",
        # "password"=>"password"}
        # a user should on be persisted if they have a name, email, and password
        if params[:name] != "" && params[:email] != "" && params[:password] != "" 
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
        else
        redirect '/signup'
        end
    end

    # user show route
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb  :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end