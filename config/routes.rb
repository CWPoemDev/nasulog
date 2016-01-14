Rails.application.routes.draw do
  get  '/auth/:provider/callback', to:'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get  '/auth/failure' => 'sessions#failure'
  get  '/logout' => 'sessions#destroy'

  resources :home
  resources :poems
  resources :read_poems, only: [:create, :destroy]
  resource :user, only: [:edit, :update]
  root to: 'home#index'
end
