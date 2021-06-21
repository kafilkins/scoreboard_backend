Rails.application.routes.draw do
  resources :scores
  resources :news
  resources :standings
  resources :rosters
  resources :teams
  resources :scraper
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
