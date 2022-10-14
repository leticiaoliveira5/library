require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:category) }
  end

  describe '#reserved?' do
    let(:book) { create(:book) }

    it 'is truthy if book has active reservation' do
      create(:reservation, book: book)

      expect(book).to be_reserved
    end

    it 'is falsey if book has no active reservation' do
      expect(book).not_to be_reserved
    end
  end
end
