module UserAuthToken
  class RenewController < ApplicationController
    skip_before_action :validate_token

    def update
      user = User.find_by(email: params[:email])

      return render json: { error: I18n.t("general.errors.user.not_found") }, status: :not_found if user.nil?

      renewed_token = UserAuthToken::Renew.call(user)

      render status: renewed_token.success? ? :ok : :unprocessable_entity
    end
  end
end
