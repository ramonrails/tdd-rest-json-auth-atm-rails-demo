Rails.application.routes.draw do

  resources :tellers
  post 'authenticate', to: 'authentication#authenticate'
end
