class Api::BooksController < ApplicationController
  before_action :set_author, except: [:all_books]
  before_action :set_book, only: [:show, :destroy, :update]

  def all_books
    render json: Book.all.order(genre: :desc)
  end

  def index
    render json: @author.books
  end

  def show
      render json: @book
  end

  def create
     @book = @author.books.new(book_params)
     if(@book.save)
       render json: @book
     else
       render json: @book.errors.full_messages, status: 422
     end
  end

  def update
      if(@book.update(book_params))
        render json: @book
      else
        render json: @book.errors.full_messages, status: 422
      end
   end

  def destroy
    render json: @book.destroy 
  end


  private
  def set_author
      @author = Author.find(params[:author_id])
  end

  def set_book
      @book = @author.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :genre)
  end
end
