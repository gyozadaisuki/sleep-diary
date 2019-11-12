Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  resources :users
  get '/signup',  to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
