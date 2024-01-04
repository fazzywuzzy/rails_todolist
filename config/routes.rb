Rails.application.routes.draw do
  resources :todos, only: [:index, :create, :destroy, :update] # Add :update to the list of allowed actions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"
end
