Rails.application.routes.draw do
  resources :userrequests
  resources :news
  devise_for :users
  root 'news#index'
  resources :users
end
