Rails.application.routes.draw do
  root to: 'welcome#index'

  get :signup, to: "registrations#new"
  get :login, to: "sessions#new"
  resource :registrations, only: :create
  resource :sessions, only: [:create, :destroy]
  resources :store, only: [:index, :show]
  resources :categories
  resources :products

  resources :menus, only: %i[index show create destroy] do
    resources :menus_products, only: %i[index create destroy]
  end

end
