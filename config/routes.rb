Rails.application.routes.draw do
  root to: "homes#top"
  get "home/about" => "homes#about"
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :books, only: [:index, :show, :create, :destroy, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
