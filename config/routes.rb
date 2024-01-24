Rails.application.routes.draw do
  root 'home#index'
  get '/dashbord' => 'dashbord#index'
end
