class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # Reservas com devolução atrasada
  scope :overdue, -> { where(status: 'active', devolution: ...DateTime.now) }
  scope :active, -> { where(status: 'active') }
  scope :finished, -> { where(status: 'finished') }

  # A reserva pode estar ativa, atrasada, ou finalizada
  enum status: { active: 0, finished: 1 }
end
