Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :job_postings
  resources :locations
  devise_for :users, controllers: {registrations: 'registrations'}
end
