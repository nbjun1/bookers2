Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index]
  resources :books

  root to: "homes#top"
  get '/home/about' => 'homes#about'

end
