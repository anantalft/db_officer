Rails.application.routes.draw do

  resources :articles
  mount DbOfficer::Engine => "/db_officer"
end
