Rails.application.routes.draw do

  get '/' => 'home#index'
  resources :concerts do 
  	resources :comments
  end
end
