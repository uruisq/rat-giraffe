Rails.application.routes.draw do
  resources :buildings
  root to: 'buildings#index'
end