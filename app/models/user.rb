class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate_presence_of :name

  # adiciona tipo de usuário
  enum role: { admin: 0, member: 1 }, _suffix: true
end
