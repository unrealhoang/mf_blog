MfBlog::Application.routes.draw do
  resources :tags

  root :to => "home#index"
end
