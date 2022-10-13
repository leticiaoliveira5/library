require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'validations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:book) }
    it { is_expected.to allow_values(:active, :finished, :overdue).for(:status) }
  end
end
