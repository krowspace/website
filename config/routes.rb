Rails.application.routes.draw do
  resources :krowspaces do
    collection do
      get :search
    end
  end
  root to: 'visitors#index'
  devise_for :users
  namespace :adminpanel do
    resources :krowspaces
    resources :admins
    resources :users
  end
end
