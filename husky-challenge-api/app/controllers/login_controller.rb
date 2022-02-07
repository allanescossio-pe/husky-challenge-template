class LoginController < ApplicationController
  #skip_before_action :validate_token

  def create
    login = Login::Execute.call(auth_params[:token])

    if login.success?
      render json: { user: login.result }, status: :ok
    else
      render json: { error: login.result }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:token)
  end
end
