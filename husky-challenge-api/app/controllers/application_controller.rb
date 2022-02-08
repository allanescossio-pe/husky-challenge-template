class ApplicationController < ActionController::API
  before_action :validate_token

  private

  attr_reader :current_user

  def validate_token
    token = request.headers["Authorization"]
    @current_user = User.find_by(token: token)

    render json: { error: I18n.t("general.errors.user.not_found") }, status: :unauthorized if current_user.nil?
  end
end
