Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/bookclubs/:id/join", to: "bookclubs#join", as: :join_bookclub

  get "/my-bookclubs/", to: "bookclubs#my_bookclubs", as: :my_bookclubs

  resources :bookclubs, only: %i[index new create show destroy] do
    resources :meetings, only: %i[new create show]
  end

  resources :meetings, only: [] do
    post "accept", to: "meetings#accept", as: "accept"
    post "decline", to: "meetings#decline", as: "decline"
  end

  resources :books, only: %i[index show]
end
