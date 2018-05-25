Rails.application.routes.draw do

  

  resources :notices
  resources :agencies
  resources :address_books
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

    # Backend
    scope "backend" do
      devise_for :forwarders, controllers: { registrations: "forwarders/registrations", sessions: "forwarders/sessions", passwords: "forwarders/passwords", confirmations: "forwarders/confirmations", unlocks: "forwarders/unlocks" }
      devise_scope :forwarders do
          root "dashboard#reports"
      end

      get "dashboard/reports", to: "dashboard#reports"
      get "dashboard/showreport/:id", to: "dashboard#showreport", :as => :show_report
      get "dashboard/forwardreport/:id", to: "dashboard#forwardreport", :as => :forward_report

      # tipologies
      get "dashboard/tipologies", to: "dashboard#tipologies", :as => :tipologies
      get "dashboard/createoccupation/:id", to: "dashboard#createoccupation", :as => :create_occupation
      get "dashboard/newtipology", to: "dashboard#newtipology", :as => :new_tipology
      post "dashboard/createtipology", to: "dashboard#createtipology", :as => :create_tipology
      get "dashboard/occupations", to: "dashboard#occupations", :as => :occupations
    end
end
