Rails.application.routes.draw do
  root to: 'welcome#index'
  get :signup, to: "registrations#new"
  get :login, to: "sessions#new"
  resource :registrations, only: :create
  resource :sessions, only: [:create, :destroy]
end
