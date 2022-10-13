class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # a reserva pode estar ativa, atrasada, ou finalizada
  enum status: { active: 0, overdue: 1, finished: 2 }

end
