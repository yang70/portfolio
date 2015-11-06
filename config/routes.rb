Rails.application.routes.draw do
  root 'welcome#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { sessions: "sessions/sessions", omniauth_callbacks: "omniauth_callbacks"}
  resources :projects
  resources :articles do
    resources :comments
  end
end
