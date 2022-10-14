require 'rails_helper'

RSpec.feature 'Admin edits reservation', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }
  let(:book) { create(:book) }
  let(:reservation) { create(:reservation) }

  scenario 'successfully' do
    login_as admin, scope: :user
    visit reservation_path(reservation)

    click_on 'Editar'

    expect(current_path).to eq edit_reservation_path(reservation)

    within('#reservation_status') { select 'finished' }
    click_on :commit

    expect(reservation.reload.status).to eq 'finished'
  end
end
