Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: "sessions/sessions", omniauth_callbacks: "omniauth_callbacks"}
  resources :projects
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
