Rails.application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :categories, only: [:show]

  resources :questions, except: :index

  resources :solutions, except: :index
end
