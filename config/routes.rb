Rails.application.routes.draw do
  
  devise_for :user
  root to: "users#index"

  # authenticated :user do
   #  root to: 'users#index', as: :user_root
  #end

  #devise_for :user do
  #	root to: 'devise/sessions#new'
  #end


end
