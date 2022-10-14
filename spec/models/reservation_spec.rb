require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:book) }
    it { is_expected.to validate_presence_of(:devolution) }
    it { is_expected.to allow_values(:active, :finished).for(:status) }

    it 'not longer than two weeks' do
      reservation = described_class.new(devolution: 3.weeks.from_now)

      expect(reservation).not_to be_valid
      expect(reservation.errors[:devolution]).to be_present
    end
  end
end
