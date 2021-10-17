Rails.application.routes.draw do
  resources :userrequests
  resources :news
  devise_for :users
  root 'news#index'
  resources :users
  resources :userrequests do
    member do
      get 'news_response'
    end
  end
end
