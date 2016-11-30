Rails.application.routes.draw do

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

  resources :categories, only: [:show]
  get '/categories/:id/category_data', to: 'categories#category_data'

  get '/questions/most_recent', to: 'questions#most_recent'
  get '/questions/most_popular', to: 'questions#most_popular'

  resources :questions

  resources :solutions, only: [:destroy]

  resources :votes, only: [:create]

  resources :users, only: [:show]

  resources :questions, only: [:show] do
    resources :solutions, only: [:index, :new, :edit, :update, :create]
  end
end
