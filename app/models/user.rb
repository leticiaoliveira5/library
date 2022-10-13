class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # o usuário possui reservas
  has_many :reservations, dependent: :nullify

  validates :name, :role, presence: true

  # adiciona tipo de usuário
  enum role: { admin: 0, member: 1 }, _suffix: true
end
