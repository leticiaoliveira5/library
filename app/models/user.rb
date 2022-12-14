class User < ApplicationRecord
  # Include default devise modules. Others available are: :registerable,
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Usuários não podem se registrar, um admin deve registrá-los.
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # o usuário possui reservas
  has_many :reservations, dependent: :nullify

  scope :member, -> { where(role: :member) }

  validates :name, :role, presence: true

  # adiciona tipo de usuário
  enum role: { admin: 0, member: 1 }, _suffix: true
end
