Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/account', to: 'users#show', as: :user
end
