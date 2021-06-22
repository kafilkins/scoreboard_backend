Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do
      resources :scores
      resources :news
      resources :standings
      resources :rosters
      resources :teams
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#fetch('http://127.0.0.1:3000/api/v1')
