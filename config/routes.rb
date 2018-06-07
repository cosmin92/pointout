Rails.application.routes.draw do

  devise_for :signalers, controllers: {registrations: "signalers/registrations", sessions: "signalers/sessions", omniauth_callbacks: "signalers/omniauth_callbacks", passwords: "signalers/passwords", confirmations: "signalers/confirmations", unlocks: "signalers/unlocks"}
  devise_scope :signaler do
    get "signalers/profile", to: "signalers/registrations#profile"
    get "signalers/timeline", to: "signalers/registrations#timeline"
  end

  resources :reports, only: [:new, :create, :edit, :update, :destroy] do
    resources :images, :only => [:create]
    resources :observations, only: [:create, :destroy]
    post "/interventions", to: "interventions#create"
  end


  resources :reports, only: [:index, :show]
  get "reports/tags/:tag", to: "reports#index", as: :tag

  get "reports/suspend/:id", to: "reports#suspend", as: :suspend_report
  get "reports/not_suspend/:id", to: "reports#not_suspend", as: :not_suspend_report
  get "reports/stores/:id", to: "reports#stores", as: :stores_report

  get "static_pages/home"
  root "static_pages#home"

  # Backend
  scope "backend" do
    devise_for :forwarders, controllers: {registrations: "forwarders/registrations", sessions: "forwarders/sessions", passwords: "forwarders/passwords", confirmations: "forwarders/confirmations", unlocks: "forwarders/unlocks"}
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

    # Agencies
    get "dashboard/my_agencies", :to => "dashboard#my_agencies", :as => :my_agencies
    get "dashboard/create_contact/:id", :to => "dashboard#create_contact", :as => :create_contact
    resources :agencies

    # Address books
    resources :address_books, :except => [:show]

    # Tipolgies
    get "dashboard/create_occupation/:id", :to => "dashboard#create_occupation", :as => :create_occupation
    get "dashboard/remove_occupation/:id", :to => "dashboard#remove_occupation", :as => :remove_occupation
    get "dashboard/occupations", :to => "dashboard#occupations", :as => :occupations
    resources :tipologies, :except => [:show]

    # group
    get "dashboard/members"
    get "dashboard/make_boss/:id", :to => "dashboard#make_boss", :as => :make_boss
    get "dashboard/remove_boss/:id", :to => "dashboard#remove_boss", :as => :remove_boss
    patch	"dashboard/update_group/:id", :to => "dashboard#update_group", :as => :update_group
    get "dashboard/edit_group/:id/edit", :to => "dashboard#edit_group", :as => :edit_group
  end
end
