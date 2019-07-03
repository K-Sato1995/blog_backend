Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :posts
    resources :categories
    resources :tags
  end
  namespace :api do
    namespace :v1 do
      get '/posts_list', to: 'posts#posts_list'
      resources :posts, only: [:index, :show] do
        put 'like' => 'posts#like', on: :member
        resources :comments, only: [:create]
      end
    end
  end
end
