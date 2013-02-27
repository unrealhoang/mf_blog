MfBlog::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :profiles

  resources :posts

  resources :categories

  resources :tags

  resources :posts

  resources :profiles

  root :to => "home#index"
end
