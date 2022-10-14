module ApplicationHelper
  def book_cover(book)
    cover = book.cover.attached? ? book.cover : 'no-cover.jpg'
    image_tag(cover, width: '100%')
  end

  def book_admin_links(book)
    button_to 'Editar', edit_book_path(book), class: 'btn btn-primary'
  end

  def book_member_links(book)
    if book.reservations.active.empty?
      button_to 'Reservar', new_reservation_path, class: 'btn btn-primary'
    else
      content_tag(:div, 'O livro não está disponível no momento', class: 'danger')
    end
  end
end
