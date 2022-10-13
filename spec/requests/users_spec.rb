require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }

  before { sign_in(admin) }

  describe 'GET /new' do
    context 'admin is signed in' do
      it 'show user form' do
        get new_user_path

        expect(response).to be_successful
      end
    end

    context 'member is signed in' do
      before { sign_in(member) }

      it 'redirects' do
        get new_user_path

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'GET /show' do
    it 'show user by id' do
      user = create(:user, :member)

      get user_path(user)

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new user' do
      post users_path, params: { user: { email: 'anamuniz@bol.net', password: '123456a',
                                         name: 'Ana Muniz', role: :member } }

      expect(response).to redirect_to(User.last)
      expect(flash[:notice]).to be_present
    end
  end
end
