Rails.application.routes.draw do
  
  resources :urls
  get '/pages' => 'urls#index'
  
  root to: "urls#new"

end
