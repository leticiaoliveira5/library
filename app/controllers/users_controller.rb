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
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :role)
  end

  def authorize_admin
    return if current_user.admin_role?

    redirect_to root_path, alert: t('authorize_role_message')
  end
end
