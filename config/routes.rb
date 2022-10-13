Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    root 'books#index'
    devise_for :user
    resources :books, except: :destroy
    resources :reservations, except: :destroy
    resources :users, only: %i[new create show]
  end
end
