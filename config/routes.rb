Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'travels#index'
  resources :travels, only: :index

  namespace :api do
    namespace :v1 do
      resources :vehicles, only: [:index, :create]
    end
  end
end
