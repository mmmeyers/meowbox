Rails.application.routes.draw do
  devise_for :users

  root 'subscriptions#index'

  resources :subscriptions
  resources :users

  scope "/admin" do
    resources :boxes
  end

end
