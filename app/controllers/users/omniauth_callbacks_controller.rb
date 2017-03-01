class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth!(request.env["omniauth.auth"])
    respond_to do |format|
      format.html do
        sign_in_and_redirect @user
      end

      format.json do
        sign_in @user
        render json: { success: true, user: @user, redirect_url: root_url },
          status: 200
      end
    end
  end
end
