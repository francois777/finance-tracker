Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'show_profile', to: 'users#show_profile'

  resources :friendships, only: [:index, :create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
  get 'search_stock', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  post 'add_stock_of_a_friend', to: 'user_stocks#add_stock_of_a_friend'
end
