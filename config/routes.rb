Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'players#index'
  resources :players, except: [:index]
  resources :games do
    resources :badges
    resources :matches
  end
end
