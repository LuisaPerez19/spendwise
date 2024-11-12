Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "dashboard#index"
  resources :categories do
    resources :expenses, only: [ :new, :create ]
  end

  resources :expenses

  get '/dashboard', to: 'dashboard#index'

  resources :dashboard, only: [:index] do
    get 'recent_expenses', on: :collection
  end

end
