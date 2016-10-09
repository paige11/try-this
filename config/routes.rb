Rails.application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :categories, only: [:show]

  resources :questions, except: [:show]

  resources :solutions, except: [:show, :index, :new, :edit]
  
  resources :questions, only: [:show] do
    resources :solutions, only: [:index, :new, :edit]
  end
end
