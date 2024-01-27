Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/dashbord' => 'dashbord#index'
end
