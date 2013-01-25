MfBlog::Application.routes.draw do
  resources :categories

  resources :tags

  root :to => "home#index"
end
