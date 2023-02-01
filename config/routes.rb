Rails.application.routes.draw do
  devise_for :users
  get 'users/show'
  get 'users/edit'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'new/index'
  get 'new/show'
  get 'homes/top'
  resources :users, only: [:edit, :show]
  resources :books, only: [:index, :show]
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
