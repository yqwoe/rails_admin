Rails.application.routes.draw do
  root to: 'home#index'
  namespace :v1 do
    resources :sessions,only:[:create,:destroy]
    namespace :admin do
      resources :groups
      resources :users
      resources :roles
      resources :resources
    end
  end
  match '*path', via: :all, to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
