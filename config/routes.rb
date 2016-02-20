Rails.application.routes.draw do
  get 'message/create'

  get 'message/update'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  root to: 'welcome#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :rooms, only: [:new, :create, :index, :show] do
    resources :messages, only: [:new, :create]
  end
end
