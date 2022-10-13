require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:user) { create(:user, :admin) }

  before { sign_in(user) }

  describe 'GET /index' do
    it 'request list of all books' do
      Book.create(title: 'Era Uma Vez', author: create(:author), category: create(:category))

      get books_path

      expect(response).to be_successful
      # expect(response.body).to include('Era Uma Vez')
    end
  end

  describe 'GET /new' do
    it 'show book form' do
      get new_book_path

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let(:book) { Book.create(title: 'Era Uma Vez', author: create(:author), category: create(:category)) }

    context 'user is admin' do
      it 'show book form' do
        get edit_book_path(book)

        expect(response).to be_successful
      end
    end

    context 'user is member' do
      let(:user) { create(:user, :member) }

      it 'redirect' do
        get edit_book_path(book)

        expect(response).to redirect_to books_path
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe 'POST /create' do
    it 'creates a new book successfully' do
      post books_path, params: { book: { title: 'As Crônicas de Nárnia',
                                         author_id: author.id,
                                         category_id: category.id } }

      expect(response).to redirect_to(Book.last)
      expect(flash[:notice]).to be_present
      # expect(response.body).to include 'Livro criado com sucesso'
    end
  end

  describe 'GET /show' do
    it 'show book by id' do
      book = Book.create(title: 'Era Uma Vez', author: create(:author), category: create(:category))

      get book_path(book)

      expect(response).to be_successful
      # expect(response.body).to include(book.title)
    end
  end
end
