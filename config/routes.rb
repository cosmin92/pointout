Rails.application.routes.draw do
  devise_for :signalers
  get "static_pages/home"

  root "static_pages#home"
end
