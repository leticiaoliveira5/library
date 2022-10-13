class BooksController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @book = Book.find(params[:id])
  end

  def new; end

  def create; end

  def edit; end
end
