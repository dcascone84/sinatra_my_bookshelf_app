class BooksController < ApplicationController

    # line 8 - get books/new to render a form to create a new book
    # post books receives the form and creates a new book with the imfomation entered
    # show route for books
    # index route displays all books

    get '/book/new' do
        erb :'/books/new'
    end

    post '/books' do
        # the params look like: 
        # {"title"=>"a title", "author"=>"the author", "genre"=>"the genre"}
        # binding.pry
    end
end