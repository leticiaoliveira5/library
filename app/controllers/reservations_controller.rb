class ReservationsController < ApplicationController
  before_action :authenticate_user!
  # Verifica se usuário é admin
  before_action :authorize_admin, only: %i[index edit]

  def index
    @overdue = reservation_scope.overdue
    @actives = reservation_scope.active
    @finished = reservation_scope.finished
  end

  def show
    @reservation = reservation_scope.find(params[:id])
  end

  def new
    @reservation = reservation_scope.new
  end

  def create
    @reservation = reservation_scope.new(reservation_params)
    @reservation.user = current_user if current_user.member_role?
    if @reservation.save
      @reservation.active!
      redirect_to @reservation, notice: t('.success')
    end
  end

  def edit
    @reservation = reservation_scope.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:book_id, :user_id, :devolution)
  end

  def authorize_admin
    return if current_user.admin_role?

    redirect_to reservations_path, alert: t('authorize_role_message')
  end

  # Se o usuário for admin, pode buscar por todas as reservas, mas se for membro,
  # poderá buscar apenas pelas suas reservas
  def reservation_scope
    if current_user.admin_role?
      Reservation.all
    else
      current_user.reservations
    end
  end
end
