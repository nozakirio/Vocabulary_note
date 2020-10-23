Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  
end
