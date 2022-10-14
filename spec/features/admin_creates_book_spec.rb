require 'rails_helper'

RSpec.feature 'Admin creates book', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }
  let!(:category) { create(:category) }
  let!(:author) { create(:author) }

  scenario 'Admin creates book' do
    login_as admin, scope: :user
    visit root_path

    expect(page).to have_link(href: new_book_path)

    click_on 'Cadastrar novo livro'

    expect(current_path).to eq new_book_path

    fill_in :book_title, with: 'E o vento levou'
    within('#book_category_id') { select category.name }
    within('#book_author_id') { select author.name }
    click_on :commit

    expect(current_path).to eq book_path(Book.last)
  end
end
