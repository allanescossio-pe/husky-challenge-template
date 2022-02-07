module Login
  class Validate < ApplicationServiceValidator
    delegate :auth_token_has_been_validated, to: :user, allow_nil: true

    validates_presence_of :user, message: I18n.t("general.errors.user.not_found")
    validate :auth_token_validated

    def initialize(user)
      @user = user
    end

    def call
      return error_result(error_messages) unless valid?

      success_result
    end

    private

    attr_reader :user

    def auth_token_validated
      return if user.nil?

      errors.add(:user, I18n.t("general.errors.user.need_validate_auth_token")) unless auth_token_has_been_validated
    end
  end
end
