Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ads
  post 'signup', to: 'users#signup'
  post 'auth/login', to: 'authentication#authenticate'
end
