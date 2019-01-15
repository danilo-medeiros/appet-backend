Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ads do
    post 'picture', on: :member
  end
  post 'signup', to: 'users#signup'
  post 'auth/login', to: 'authentication#authenticate'
  get 'register', to: 'authentication#register'
  get 'auth/refresh', to: 'authentication#refresh'
  put 'register', to: 'users#update'
end
