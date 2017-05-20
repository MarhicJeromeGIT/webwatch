Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dom#welcome'

  resources :followed_pages
  
  get 'welcome', to: 'dom#welcome'
  get 'follow', to: 'dom#follow'
  get 'follow-confirmation', to: 'dom#follow_confirmation'
end
