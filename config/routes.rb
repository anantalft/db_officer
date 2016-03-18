DbOfficer::Engine.routes.draw do
  resources :main
  root to: "main#index"
  resources :tables
end
