Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dom#follow'

  resources :followed_pages
  
  get 'follow', to: 'dom#follow'
  get 'follow-confirmation', to: 'dom#follow_confirmation'
end
