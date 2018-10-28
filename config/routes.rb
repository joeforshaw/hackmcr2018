Rails.application.routes.draw do
  resource :users, only: [:create]
  get 'faq', to: 'pages#faq', as: 'faq'
  root to: 'users#new'
end
