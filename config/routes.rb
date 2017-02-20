Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show] do
    resources :characters
  end

  resources :combat_scenarios do
    resources :creatures

    get '/characters', to: 'combat_scenarios#characters_index'
    get '/character/new', to: 'combat_scenarios#new_character'
    delete '/characters', to: 'combat_scenarios#remove_characters'

    resources :characters, only: [:show]

    delete '/characters/:id', to: 'combat_scenarios#remove'

  end

  namespace :admin do
    resources :users, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
