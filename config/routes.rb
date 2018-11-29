Rails.application.routes.draw do

  resources :subscribers
  devise_for :users

  
  resources :portfolios do
    put :sort, on: :collection
    member do 
      get :toggle_status
    end
  end
  
  resources :blogs, :path => "reviews" do
    member do
      get :toggle_status
    end
  end

  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'
  
  get 'support', to: 'support#new', as: 'new_support'
  post 'support', to: 'support#create', as: 'create_support'

  get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

end