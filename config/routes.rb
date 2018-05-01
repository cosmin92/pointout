Rails.application.routes.draw do

  devise_for :signalers, controllers: {
    registrations: "signalers/registrations",
    sessions: "signalers/sessions",
    omniauth_callbacks: "signalers/omniauth_callbacks",
    passwords: "signalers/passwords",
    confirmations: "signalers/confirmations",
    unlocks: "signalers/unlocks"
  }

  devise_scope :signaler do
    get 'signalers/profile', to: 'signalers/registrations#profile'
    get 'signalers/timeline', to: 'signalers/registrations#timeline'
  end

  get "static_pages/home"
  get "static_pages/about"

  root "static_pages#home"
end
