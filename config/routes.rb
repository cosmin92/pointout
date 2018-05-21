Rails.application.routes.draw do

    get 'observations/create'

    get 'observations/destroy'

    devise_for :signalers, controllers: { registrations: "signalers/registrations", sessions: "signalers/sessions", omniauth_callbacks: "signalers/omniauth_callbacks", passwords: "signalers/passwords", confirmations: "signalers/confirmations", unlocks: "signalers/unlocks" }
    devise_scope :signaler do
      get 'signalers/profile', to: 'signalers/registrations#profile'
      get 'signalers/timeline', to: 'signalers/registrations#timeline'
    end

    authenticate :signaler do
      resources :reports, only: [:new, :create, :edit, :update, :destroy] do
        resources :images, :only => [:create]
        resources :observations, only: [:create, :destroy]
        post "/interventions", to: "interventions#create"
      end
    end

    resources :reports, only: [:index, :show]
    get 'reports/tags/:tag', to: 'reports#index', as: :tag


    get "static_pages/home"
    get "static_pages/about"

    root "static_pages#home"
end
