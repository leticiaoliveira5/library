Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    devise_for :user
    root 'devise/sessions#new'
  end
end
