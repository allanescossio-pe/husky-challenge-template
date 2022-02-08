module UserAuthToken
  class ValidateController < ApplicationController
    skip_before_action :validate_token

    def update
      user = User.find_by(id: params[:id])

      return render json: { error: I18n.t("general.errors.user.not_found") }, status: :not_found if user.nil?

      validated_token = UserAuthToken::Validate.call(user)

      render status: validated_token.success? ? :ok : :unprocessable_entity
    end
  end
end
