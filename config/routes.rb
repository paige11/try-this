Rails.application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :questions, only: [:show] do
    resources :solutions, only: [:index]
  end

  resources :questions, except: [:show]

  resources :solutions, except: [:show, :index]
end
