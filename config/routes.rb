Rails.application.routes.draw do
  get  '/auth/:provider/callback', to:'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get  '/auth/failure' => 'sessions#failure'
  get  '/logout' => 'sessions#destroy'

  resources :home
  resources :poems, shallow: true do
    resources :read_poems, only: [:index, :show, :create, :destroy]
  end
  resource :user, only: [:show, :edit, :update]
  root to: 'home#index'

  namespace :api do
    resources :emoji, only: [:index]
    resources :markdown_previews, only: [:create]
  end
end
