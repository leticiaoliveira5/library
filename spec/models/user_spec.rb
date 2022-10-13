require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to allow_values(:member, :admin).for(:role) }
    it { is_expected.to have_many(:reservations) }
  end
end
