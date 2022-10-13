class Book < ApplicationRecord
  # Um livro pertence a um autor e a uma categoria,
  # e possui reservas, mas apenas uma deve estar ativa
  belongs_to :author
  belongs_to :category
  has_many :reservations, dependent: :nullify

  validates :title, presence: true
end
