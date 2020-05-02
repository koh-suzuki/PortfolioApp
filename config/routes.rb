Rails.application.routes.draw do
  
  get 'users/index'
  get 'users/show'
  root 'homes#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  resources :articles
  resources :healths
  resources :users do
    member do
      get 'test_edit'
    end
    get 'healths/show'
    get 'healths/edit'
    resources :healths, only: [:edit]
  end
end
