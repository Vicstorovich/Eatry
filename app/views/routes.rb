Rails.application.routes.draw do
  post :signup, to: 'users#create'
  get :signup, to: 'users#new'
  get :about, to: 'welcome#about'
  get :contact, to: 'welcome#contact'
  get :home, to: 'welcome#home'
  get    :login,   to: 'sessions#new'
  post   :login,   to: 'sessions#create'
  delete :logout,  to: 'sessions#destroy'

  # get :signup, to: "registrations#new"

  resources :line_items
  resources :carts
  root to: 'welcome#index'

  resources :store, only: %i[index show]
  resources :menus, only: %i[index show create destroy] do
    resources :menus_products, only: %i[index create destroy]
  end
  resources :categories
  resources :products
  resources :users, only: %i[index show update destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
