class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
  end

  def create
    @book = Book.new(book_params)
    redirect_to @book, notice: 'Livro criado com sucesso' if @book.save
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :category_id)
  end
end
