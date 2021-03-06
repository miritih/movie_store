# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope module: 'api/v1', path: 'api/v1' do
    resources :movies
    resources :users, only: %i[create delete]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
