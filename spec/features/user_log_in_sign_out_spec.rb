require 'rails_helper'

RSpec.feature 'User login and sign out', type: :feature do
  let(:user) { create(:user) }

  scenario 'User login and sign out' do
    visit root_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Login'

    expect(page).to have_content(user.name)
    expect(page).to have_content('Login efetuado com sucesso!')

    click_on 'Sign Out'

    expect(current_path).to eq new_user_session_path
  end
end
