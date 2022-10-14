require 'rails_helper'

RSpec.feature 'Member creates reservation', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }
  let(:book) { create(:book) }

  scenario 'successfully' do
    login_as member, scope: :user
    visit book_path(book)

    click_on 'Reservar'

    expect(current_path).to eq new_reservation_path

    fill_in :reservation_devolution, with: 10.days.from_now.strftime('%d%m%Y').to_s
    click_on :commit

    expect(Reservation.count).to eq 1
    expect(Reservation.first.user).to eq member
    expect(Reservation.first.book).to eq book
  end
end