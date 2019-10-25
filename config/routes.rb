Rails.application.routes.draw do
  resources :cases do
    member do
      get :favindex
    end
  end
end