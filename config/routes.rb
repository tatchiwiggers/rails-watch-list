Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, except: [:index, :edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
