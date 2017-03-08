Rails.application.routes.draw do
  resources :krowspaces do
    collection do
      get :search
    end
  end
  resources :bookings do
    put :confirm
  end
  root to: 'visitors#index'
  devise_for :users
  namespace :adminpanel do
    resources :krowspaces do
        post :createseats, :on => :member
    end
    resources :admins
    resources :users

  end
end
