Rails.application.routes.draw do
  root to: 'static#home'
  resource :dashboard, only: [:show]
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users, only: [:show]
  resources :job_requests do
    member do
      put 'completed'
    end
  end
  resources :job_postings do
    collection do
      get 'requests'
    end
  end
  resources :locations
  resources :recommendations, only: [:index, :create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
