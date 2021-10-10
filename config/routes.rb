Rails.application.routes.draw do
  resources :news
  devise_for :users
  root 'news#index'
  resources :users
end
