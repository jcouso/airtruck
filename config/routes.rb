Rails.application.routes.draw do
  devise_for :users
  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :trips
  end
end
