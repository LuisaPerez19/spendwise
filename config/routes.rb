Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "categories#index"
  resources :categories do
    resources :expenses, only: [ :new, :create ]
  end

  resources :expenses, only: [ :index, :show ]

end
