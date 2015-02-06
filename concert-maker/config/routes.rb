Rails.application.routes.draw do

  get '/' => 'home#index'
  resources :concerts
end
