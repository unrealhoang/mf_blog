MfBlog::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :categories, :only => [:show]

  resources :tags, :only => [:show]

  resources :posts, :only => [:index, :show]

  resources :profiles, :only => [:show]

  root :to => "posts#index"
end
