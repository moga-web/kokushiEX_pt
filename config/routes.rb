Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'home#index'
  get '/dashbord' => 'dashbord#index'
  namespace :tests do
    get 'selections/index'
  end
end
