Rails.application.routes.draw do
  devise_for :users
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'
    get '/archives', to: 'posts#archive'
    get '/about', to: 'posts#about'
    resources :posts, only: [:index, :show]
    namespace :admin do
      resources :posts
    end
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }, via: [:get, :post]
  match '', to: redirect("/#{I18n.default_locale}"), via: [:get, :post]
end
