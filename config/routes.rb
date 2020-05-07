Rails.application.routes.draw do
  devise_for :users
  root  "comments#index"
  resources :comments
  resources :posts do
    member do
      get 'activate'
      get 'archive'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
