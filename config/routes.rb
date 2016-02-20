Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  root to: 'welcome#index'

  resources :users, only: [:new, :create]
  resources :rooms, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create]
end
