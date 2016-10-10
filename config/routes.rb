Rails.application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

  resources :categories, only: [:show]

  resources :questions

  resources :solutions, except: [:show, :index, :new, :edit]

  resources :votes, only: [:create]

  resources :users, only: [:show]

  resources :questions, only: [:show] do
    resources :solutions, only: [:index, :new, :edit]
  end
end
