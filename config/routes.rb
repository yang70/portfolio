Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions/sessions", omniauth_callbacks: "omniauth_callbacks",
    registrations: "sessions/registrations"}
  resources :projects
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
