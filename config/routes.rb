Rails.application.routes.draw do

    devise_for :signalers, controllers: { registrations: "signalers/registrations", sessions: "signalers/sessions", omniauth_callbacks: "signalers/omniauth_callbacks", passwords: "signalers/passwords", confirmations: "signalers/confirmations", unlocks: "signalers/unlocks" }
    devise_scope :signaler do
      get 'signalers/profile', to: 'signalers/registrations#profile'
      get 'signalers/timeline', to: 'signalers/registrations#timeline'
    end

    resources :reports, only: [:new, :create, :edit, :update, :destroy] do
      resources :images, :only => [:create]
      resources :observations, only: [:create, :destroy]
      post "/interventions", to: "interventions#create"
    end

    resources :reports, only: [:index, :show]
    get 'reports/tags/:tag', to: 'reports#index', as: :tag

    get "static_pages/home"
    root "static_pages#home"

    # Backend
    scope "backend" do
      devise_for :forwarders, controllers: { registrations: "forwarders/registrations", sessions: "forwarders/sessions", passwords: "forwarders/passwords", confirmations: "forwarders/confirmations", unlocks: "forwarders/unlocks" }
      devise_scope :forwarders do
          root "dashboard#index"
      end

      get "dashboard/index"
      resources :notices

      # Reports
      get "dashboard/reports"
      get "dashboard/show_report/:id", :to => "dashboard#show_report", :as => :show_report
      get "dashboard/forward_report/:id", :to => "dashboard#forward_report", :as => :forward_report
      get "dashboard/my_forwards", :to => "dashboard#my_forwards", :as => :my_forwards

      # Agenties
      get "dashboard/my_agencies", :to => "dashboard#my_agencies", :as => :my_agencies
      get "dashboard/create_contact", :to => "dashboard#create_contact", :as => :create_contact
      resources :agencies

      # Address books
      resources :address_books, :except => [:show]

      # Tipolgies
      get "dashboard/create_occupation/:id", :to => "dashboard#create_occupation", :as => :create_occupation
      resources :tipologies, :except => [:show]
    end
end
