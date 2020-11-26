Rails.application.routes.draw do
  get 'cocktails/create'
  get 'cocktails/index'
  get 'cocktails/new'
  get 'cocktails/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :show, :new, :create ]
end
