Rails.application.routes.draw do

  root "welcome#index"

  devise_for :users

  namespace :authenticable do
    resources :tasks, only: [ :index, :create, :update, :destroy ]
  end
end
