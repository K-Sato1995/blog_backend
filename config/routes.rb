Rails.application.routes.draw do
  devise_for :users, path_names: { sign_up: '' }
  root 'posts#index'
  get '/archives', to: 'posts#archive'
  get '/about', to: 'posts#about'
  resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
  end
end
