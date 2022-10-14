require 'rails_helper'

RSpec.feature 'Admin creates user', type: :feature do
  let(:admin) { create(:user, :admin) }

  scenario 'successfully' do
    login_as admin, scope: :user
    visit root_path

    click_on 'Cadastrar novo usuário'

    expect(current_path).to eq new_user_path

    fill_in_user_attributes
    click_on :commit

    new_user = User.last
    expect(current_path).to eq user_path(new_user)
    expect(new_user.name).to eq 'Nome'
    expect(new_user.role).to eq 'member'
  end

  def fill_in_user_attributes
    fill_in :user_name, with: 'Nome'
    fill_in :user_email, with: 'gustavo@bol.pt'
    within('#user_role') { select 'member' }
    fill_in :user_password, with: '123456'
    fill_in :user_password_confirmation, with: '123456'
  end
end
