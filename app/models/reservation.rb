class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # A reserva pode estar ativa, atrasada, ou finalizada
  enum status: { active: 0, finished: 1 }
end
