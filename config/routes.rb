Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  get 'simple_pages/about'

  get 'simple_pages/contact'

  post 'simple_pages/thank_you'

  post '/payments/create'

  get 'simple_pages/index'
  root 'simple_pages#landing_page'
  
  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
