class BooksController < ApplicationController
  before_action :authenticate_user!
  # Verifica se usuário é admin
  before_action :authorize_admin, only: %i[new create edit]

  def index
    @books = Book.order(:created_at).page(params[:page]).per(12)
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
    redirect_to @book, notice: t('.success') if @book.save
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :category_id, :cover)
  end
end
