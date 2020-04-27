Rails.application.routes.draw do
  resources :articles
  root 'homes#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
end
