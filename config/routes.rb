DbOfficer::Engine.routes.draw do
  resources :main
  root to: "main#index"
  resources :tables do
    resources :table_columns
  end
end
