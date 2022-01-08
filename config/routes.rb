Rails.application.routes.draw do
  devise_for :users
  root to:'home#top'
  resources :books,only:[:new, :create, :index, :show, :destroy, :edit, :update ]
  get 'home/about' => 'home#about'
  resources :users, only:[:index, :show, :edit, :update]
end
