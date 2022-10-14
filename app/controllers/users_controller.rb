class UsersController < ApplicationController
  before_action :authenticate_user!, :authorize_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to @user, notice: t('.success') if @user.save
  end

  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :role)
  end
end
