Rails.application.routes.draw do
  
  get 'profiles/edit'
  get 'users/index'
  get 'users/show'
  root 'homes#index'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }

  resources :users do
    resources :profiles, only: [:edit, :update]
    resources :healths
      get 'healths/:id/edit_body', to: 'healths#edit_body', as: 'healths_edit_body'
      patch 'healths/:id/update_body', to: 'healths#update_body', as: 'healths_update_body'
      get 'healths/:id/edit_sleep', to: 'healths#edit_sleep', as: 'healths_edit_sleep'
      patch 'healths/:id/update_sleep', to: 'healths#update_sleep', as: 'healths_update_sleep'
      get 'healths/:id/edit_water', to: 'healths#edit_water', as: 'healths_edit_water'
      patch 'healths/:id/update_water', to: 'healths#update_water', as: 'healths_update_water'
      get 'healths/:id/edit_day', to: 'healths#edit_day', as: 'healths_edit_day'
      patch 'healths/:id/update_day', to: 'healths#update_day', as: 'healths_update_day'
  end
  resources :articles
end
