Rails.application.routes.draw do
  resources :posts
  # post controler with the index action
  root "posts#index"
end
