Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'players#index'

  get '/all_matches' => 'matches#all_matches'
  get '/match/:id/close' => 'matches#close'
  get '/match/:id/reopen' => 'matches#reopen'
  patch '/match/:id/setscores' => 'matches#set_scores', as: :match

  resources :players, except: [:index]
  resources :games do
    resources :badges
    resources :matches, except: [:index]
  end
  resources :tags, only: [:index]
end
