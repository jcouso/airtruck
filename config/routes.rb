Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :trucks do
      resources :trips, except: [:index, :show]
    end
  end
  resources :trips, only: [:index, :show]
end
