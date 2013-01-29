MfBlog::Application.routes.draw do
  resources :profiles

  resources :posts

  resources :categories

  resources :tags

  resources :posts

  resources :profiles

  root :to => "home#index"
end
