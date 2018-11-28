Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "rails_admin/main#dashboard"

  get "/articles", to: "v1/articles#index"
end
