Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :goals do
    resources :tasks
    resources :completed_tasks
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  put 'profile', to: 'users#update'
  get 'users', to: 'users#index'
end
