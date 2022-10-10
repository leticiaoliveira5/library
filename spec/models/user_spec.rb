require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should allow_values(:member, :admin).for(:role) }

    it 'has a default user role' do
      expect(subject).to be_user_role
    end
  end
end
