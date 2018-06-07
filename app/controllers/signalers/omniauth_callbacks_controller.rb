# frozen_string_literal: true

class Signalers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # amazon callback
  def amazon
    @signaler = Signaler.find_signaler_email(request.env['omniauth.auth'])
    if !@signaler.nil? && @signaler.persisted?
      sign_in_and_redirect @signaler
      set_flash_message(:notice, :success, kind: "Amazon") if is_navigational_format?
    else
      flash[:alert] = "There was a problem signing you in through Amazon. Please register or try signing in later."
      redirect_to new_signaler_registration_url
    end
  end

  # github callback
  def github
    @signaler = Signaler.find_signaler_email(request.env['omniauth.auth'])
    if !@signaler.nil? && @signaler.persisted?
      sign_in_and_redirect @signaler
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else
      flash[:alert] = "There was a problem signing you in through Github. Please register or try signing in later."
      redirect_to new_signaler_registration_url
    end
  end

  # google callback
  def google_oauth2
    @signaler = Signaler.find_signaler_email(request.env['omniauth.auth'])
    if !@signaler.nil? && @signaler.persisted?
      sign_in_and_redirect @signaler
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
      flash[:alert] = "There was a problem signing you in through Google. Please register or try signing in later."
      redirect_to new_signaler_registration_url
    end
  end

  def failure
    flash[:alert] = "There was a problem signing you in. Please register or try signing in later."
    redirect_to new_signaler_registration_url
  end
end
