MfBlog::Application.routes.draw do
  resources :profiles

  resources :posts

  resources :categories

  resources :tags

  root :to => "home#index"
end
