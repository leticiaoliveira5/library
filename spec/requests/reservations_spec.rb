require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:admin) { create(:user, :admin) }
  let(:member) { create(:user, :member) }
  let(:reservation) { create(:reservation, user: member) }

  before { sign_in(admin) }

  describe 'GET /index' do
    it 'request list of all reservations' do
      get reservations_path

      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'show reservation form' do
      get new_reservation_path

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    context 'user is admin' do
      it 'show reservation form' do
        get edit_reservation_path(reservation)

        expect(response).to be_successful
      end
    end

    context 'user is member' do
      before { sign_in(member) }

      it 'redirect' do
        get edit_reservation_path(reservation)

        expect(response).to redirect_to reservations_path
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'POST /create' do
    it 'creates a new reservation successfully' do
      book = create(:book)

      post reservations_path, params: { reservation: { book_id: book.id,
                                                       devolution: 10.days.from_now,
                                                       user_id: member.id } }

      expect(response).to redirect_to(Reservation.last)
      expect(flash[:notice]).to be_present
    end
  end

  describe 'GET /show' do
    it 'show reservation by id' do
      get reservation_path(reservation)

      expect(response).to be_successful
    end
  end
end
