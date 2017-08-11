Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: 'registrations' }
  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :trucks do
      resources :trips, only: [:new, :create, :edit, :update, :destroy] do
        collection do
          get 'list'
        end
      end
    end
    resources :trips, only: [:update, :edit, :destroy, :show, :index]
  end

  resources :orders, only: [:index]

  resources :trips, only: [:index, :show] do
    resources :orders, only: [:create]
    collection do
      get 'search', to: "trips#search"
    end
  end

end
