class Book < ApplicationRecord
  # Um livro pertence a um autor e a uma categoria,
  # e possui reservas, mas apenas uma deve estar ativa
  belongs_to :author
  belongs_to :category
  has_many :reservations, dependent: :nullify
  has_many :active_reservations, -> { where(status: :active) },
           class_name: 'Reservation', inverse_of: :book

  has_one_attached :cover

  validates :title, presence: true

  def reserved?
    active_reservations.present?
  end
end
