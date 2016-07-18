Rails.application.routes.draw do
  resources :as
  resources :jobs
  resources :posts
 devise_for :users
 root "pages#home"
 get "about" => "pages#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
