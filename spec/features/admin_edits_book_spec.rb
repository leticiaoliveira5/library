require 'rails_helper'

RSpec.feature 'Admin edits book', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }
  let(:book) { create(:book) }

  scenario 'Admin edits book title' do
    login_as admin, scope: :user
    visit book_path(book)

    expect(page).to have_link(href: edit_book_path(book))

    click_on 'Editar'

    expect(current_path).to eq edit_book_path(book)

    fill_in :book_title, with: 'Novo Título'
    click_on :commit

    expect(book.reload.title).to eq 'Novo Título'
  end
end
