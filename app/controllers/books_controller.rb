class BooksController < ApplicationController

    get '/books' do 
        find_book
        @books = Book.all
        erb :'/books/index'
      end

    get '/books/new' do
        if logged_in?
            erb :'/books/new'
        else
            redirect '/'
        end
    end

    post '/books' do
        if !logged_in?
            redirect :'/'
        end

        if params[:title] != "" && params[:author] != "" && params[:genre] != ""
            @book = Book.create(title: params[:title], author: params[:author], genre: params[:genre], user_id: current_user.id)
            redirect :"/books/#{@book.id}"
        else
            redirect :'/books/new'
        end
    end

    get '/books/:id' do
        find_book
        erb  :'/books/show'
      end

    get "/books/:id/edit" do
        find_book
        if logged_in?
            if @book.user == current_user
                erb :'/books/edit'
            else
                redirect :"/users/#{current_user.id}"
            end
        else
            redirect :'/'
        end
    end

    patch '/books/:id' do
        find_book
        if logged_in?
            if @book.user == current_user && params != ""
                @book.update(title: params[:title], author: params[:author], genre: params[:genre])
                redirect :"/books/#{@book.id}"
            else
                redirect :"/users/#{current_user.id}"
            end
        else
            redirect :'/'
        end
    end

    delete '/books/:id' do
        find_book
        if current_user == @book.user
            @book.destroy
            redirect :'/books'
        else
            redirect :'/books'
        end
    end

    private
        def find_book
            @book = Book.find_by(id: params[:id])
        end
end
    
