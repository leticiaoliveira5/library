class ReservationsController < ApplicationController
  before_action :authenticate_user!
  # Verifica se usuário é admin
  before_action :authorize_admin, only: %i[index edit]

  def index
    @overdue = current_user.reservations.overdue
    @actives = current_user.reservations.active
    @finished = current_user.reservations.finished
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def new
    @reservation = current_user.reservations.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.user = current_user if current_user.member_role?
    if @reservation.save
      @reservation.active!
      redirect_to @reservation, notice: t('.success')
    end
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:book_id, :user_id, :devolution)
  end

  def authorize_admin
    return if current_user.admin_role?

    redirect_to reservations_path, alert: t('authorize_role_message')
  end
end
