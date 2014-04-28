Rails.application.routes.draw do
  root 'welcome#index'

  resources :pictures
  resources :videos

end
