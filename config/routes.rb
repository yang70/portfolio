Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users, controllers: { sessions: "sessions/sessions", omniauth_callbacks: "omniauth_callbacks",
    registrations: "sessions/registrations"}
  resources :projects
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
