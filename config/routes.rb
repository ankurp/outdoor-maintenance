Rails.application.routes.draw do
  root to: 'static#home'
  resource :dashboard, only: [:show]
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :job_requests
  resources :job_postings do
    collection do
      get 'requests'
    end
  end
  resources :locations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
