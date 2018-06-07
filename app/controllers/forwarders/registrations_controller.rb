# frozen_string_literal: true

class Forwarders::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  layout "forwarder_autentication"

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # POST /resource
  def create
    if !params.has_key?(:create_new_group) || params[:create_new_group] != "1"
      super
    elsif params.has_key?(:create_new_group) || params[:create_new_group] == "1"
      group = Group.new(group_params)
      if group.save
        params[:forwarder][:group_id] = group.id
        params[:forwarder][:boss] = true
        super
      else
        redirect_to new_forwarder_registration_path
      end
    else
      redirect_to new_forwarder_registration_path
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_picture, :profile_picture_cache, :remove_profile_picture, :email, :password, :password_confirmation, :remember_me, :boss, :group_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profile_picture, :profile_picture_cache, :remove_profile_picture, :email, :password, :password_confirmation, :current_password])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    dashboard_index_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    dashboard_index_path
  end

  # The path used after edit.
  def after_update_path_for(resource)
    dashboard_index_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :logo, :parent_id)
  end
end
