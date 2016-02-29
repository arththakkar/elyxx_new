class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if params[:user][:email].present? && params[:user][:password].present?
      user = User.find_by_email(params[:user][:email])
      if user.present?
        if user.valid_password?(params[:user][:password])
          sign_in user
          flash[:success] = "Signed In Successfully."
        else
          flash[:danger] = "Oh! Password is Incorrect."
        end
      else
        flash[:danger] = "Oops! We don't have anyone registered with this Email."
      end
    else
      flash[:danger] = "Username and Password can't be blank."
    end
    redirect_to root_path
    # super
  end

  def destroy
    sign_out current_user
    flash[:success] = "User Signed Out Successfully."
    redirect_to root_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
