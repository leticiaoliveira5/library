class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :devolution, presence: true
  # A data de devolução não deve ser maior que duas semanas
  # a partir da data de criação da reserva
  validate :not_longer_than_two_weeks, unless: -> { devolution.blank? }, on: :create
  validate :user_is_member

  # Reservas com devolução atrasada
  scope :overdue, -> { where(status: 'active', devolution: ...DateTime.now) }
  scope :active, -> { where(status: 'active') }
  scope :finished, -> { where(status: 'finished') }

  # A reserva pode estar ativa, atrasada, ou finalizada
  enum status: { active: 0, finished: 1 }

  def not_longer_than_two_weeks
    return unless devolution > DateTime.now + 2.weeks

    errors.add(:devolution, :longer_than_two_weeks)
  end

  def user_is_member
    return if user.member_role?

    errors.add(:user, :not_member)
  end
end
