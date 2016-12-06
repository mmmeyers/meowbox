Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }

  root 'subscriptions#index'

  resources :subscriptions
  resources :users

  resources :boxes do
    resources :items
  end

  post '/boxes/:id', to: 'boxes#show'

end
