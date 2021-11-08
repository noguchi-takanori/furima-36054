Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:create, :new, :show, :edit, :update, :destroy]

  resources :items do
    resources :orders, only: [:index, :create] 
  end

end
