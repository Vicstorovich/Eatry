class Api::AuthTokensController < Api::BaseController
  def create
    if params[:password].present? && params[:email].present?
      client = App.find_by(email: params[:email])
      if client.present? && client.valid_password?(params[:password])
        auth_token = client.token
      end
    end

    raise NotAuthorized if auth_token.blank?

    respond_with_success({ success: true, auth_token: auth_token }, 201)
  end
end
