# frozen_string_literal: true

class ConservationGroups::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @conservation_group = ConservationGroup.new
  end

  def create
    @conservation_group = ConservationGroup.new(sign_up_params)
     unless @conservation_group.valid?
       render :new and return
     end
    session["devise.regist_data"] = {conservation_group: @conservation_group.attributes}
    session["devise.regist_data"][:conservation_group]["password"] = params[:conservation_group][:password]
    @conservation_group_address = @conservation_group.build_conservation_group_address
    render :new_conservation_group_address
  end

  def create_address
    @conservation_group = ConservationGroup.new(session["devise.regist_data"]["conservation_group"])
    @conservation_group_address = ConservationGroupAddress.new(conservation_group_address_params)
     unless @conservation_group_address.valid?
       render :new_conservation_group_address and return
     end
    @conservation_group.build_conservation_group_address(@conservation_group_address.attributes)
    @conservation_group.save
    session["devise.regist_data"]["conservation_group"].clear
    sign_in(:conservation_group, @conservation_group)
    redirect_to root_path
  end
 
  private
 
  def conservation_group_address_params
    params.require(:conservation_group_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:group_name, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
