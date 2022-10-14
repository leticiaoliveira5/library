module ApplicationHelper
  def book_cover(book)
    cover = book.cover.attached? ? book.cover : 'no-cover.jpg'
    link_to image_tag(cover, width: '100%'), book
  end

  def book_admin_links(book)
    if book.active_reservations.blank?
      link_to 'Criar nova reserva', new_reservation_path, class: 'btn btn-primary'
    end
    .concat(link_to 'Editar', edit_book_path(book), class: 'btn btn-primary', style: 'margin-left: 5px;')
  end

  def book_member_links(book)
    if book.active_reservations.blank?
      link_to 'Reservar', new_reservation_path, class: 'btn btn-primary'
    else
      content_tag(:div, 'O livro não está disponível no momento', class: 'hint')
    end
  end
end
