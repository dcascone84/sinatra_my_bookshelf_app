class BooksController < ApplicationController

    # line 8 - get books/new to render a form to create a new book
    # line 12 - post books receives the form and creates a new book with the imfomation entered
    # show route for books
    # index route displays all books

    get '/book/new' do
        # need to check if logged in
        erb :'/books/new'
    end

    post '/books' do
        # the params look like: 
        # {"title"=>"a title", "author"=>"the author", "genre"=>"the genre"}
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
        @book = Book.find_by(id: params[:id])
        erb  :'/books/show'
      end

      get "/books/:id/edit" do
        erb :'/books/edit'
      end
end