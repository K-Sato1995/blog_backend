Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
  end
end
