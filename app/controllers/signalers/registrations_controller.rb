# frozen_string_literal: true

class Signalers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  prepend_before_action :authenticate_scope!, only: [:profile, :timeline, :edit, :update, :destroy]

  layout "signaler_autentication", :only => [:new]

  # Show profile informations
  def profile
  end

  # Show reports sents end observations makes
  def timeline
    @reports = current_signaler.reports
    @observations = current_signaler.observations
    @reports.sort_by(&:created_at)
    @observations.sort_by(&:created_at)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :profile_picture, :profile_picture_cache, :remove_profile_picture, :street, :number, :city, :zip_code, :id_card_number, :municipality, :release_date, :expiration_date, :email, :password, :password_confirmation, :remember_me])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :profile_picture, :profile_picture_cache, :remove_profile_picture, :street, :number, :city, :zip_code, :id_card_number, :municipality, :release_date, :expiration_date, :email, :password, :password_confirmation, :current_password])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    signalers_profile_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    signalers_profile_path
  end

  # The path used after edit.
  def after_update_path_for(resource)
    signalers_profile_path
  end
end
