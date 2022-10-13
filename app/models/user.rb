class User < ApplicationRecord
  # Include default devise modules. Others available are: :registerable,
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Usuários não podem se registrar, um admin deve registrá-los.
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # o usuário possui reservas
  has_many :reservations, dependent: :nullify

  validates :name, :role, presence: true

  # adiciona tipo de usuário
  enum role: { admin: 0, member: 1 }, _suffix: true

  # Se o usuário for admin, pode buscar por todas as reservas, mas se for membro,
  # poderá buscar apenas pelas suas reservas
  def reservations
    if admin_role?
      Reservation.all
    else
      super
    end
  end
end
