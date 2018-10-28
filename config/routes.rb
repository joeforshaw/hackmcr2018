Rails.application.routes.draw do
  resource :users, only: [:create]
  root to: 'users#new'
end
