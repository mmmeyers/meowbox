Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations' }

  root 'subscriptions#index'

  resources :subscriptions
  get 'api/subscriptions', to: 'subscriptions#api_index'

  resources :users

  resources :boxes do
    resources :items
  end

  post '/boxes/:id', to: 'boxes#show'

end
