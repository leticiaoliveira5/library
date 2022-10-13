class BooksController < ApplicationController
  before_action :authenticate_user!
  # Verifica se usuário é admin
  before_action :authorize_admin, only: %i[new create edit]

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

  def authorize_admin
    return if current_user.admin_role?

    redirect_to books_path, alert: 'Somente admins podem acessar esta página!'
  end
end
