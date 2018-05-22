Rails.application.routes.draw do
  
  resources :urls
  root to: "front#home"

end
