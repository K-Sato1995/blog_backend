Rails.application.routes.draw do
  devise_for :users
  resources :authors
  # Create new users
  get  '/signup',  to: 'authors#new'
  post '/signup',  to: 'authors#create'
  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  namespace :admin do
    resources :posts
    resources :categories
    resources :tags
    resources :comments
  end
  namespace :api do
    namespace :v1 do
      get '/posts_list', to: 'posts#posts_list'
      resources :posts, only: [:index, :show] do
        put 'like' => 'posts#like', on: :member
        resources :comments, only: [:create]
      end
    end

    namespace :v2 do
      resources :categories, only: :index
      resources :tags, only: :index
      get '/featured_posts', to: 'posts#featured_posts'
      resources :posts, only: [:index, :show] do
        put 'like' => 'posts#like', on: :member
        resources :comments, only: [:create]
      end
    end
  end
end
