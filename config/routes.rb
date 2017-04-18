Rails.application.routes.draw do
  resources :krowspaces do
    collection do
      get :search
    end
  end
  resources :bookings do
    put :confirm
  end
  root to: 'krowspaces#index'
  resources :users ,only: [] do
    collection do
      get :bookings
    end
  end
  devise_for :users
  namespace :adminpanel do
    resources :krowspaces do
       resources :seats
    end
    resources :admins
    resources :users

  end
end
