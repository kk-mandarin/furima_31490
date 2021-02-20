Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  #resources :usere, only [:index, :create] do
    resources :items, only: [:index, :new, :create]
  #end
  #resources :items do
  #end
end
