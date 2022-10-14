require 'rails_helper'

RSpec.feature 'Navbar Links', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }

  scenario 'user is admin' do
    login_as admin, scope: :user
    visit root_path

    expect(page).to have_link(href: new_book_path)
    expect(page).to have_link(href: new_user_path)
  end

  scenario 'user is member' do
    login_as member, scope: :user
    visit root_path

    expect(page).not_to have_link(href: new_book_path)
    expect(page).not_to have_link(href: new_user_path)
  end
end
