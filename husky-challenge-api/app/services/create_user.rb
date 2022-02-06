class CreateUser < ApplicationService
  def initialize(user_params)
    @user_params = user_params
  end

  def call
    User.transaction do
      user = User.new(user_params)

      return error_result(user.errors) unless user.save

      UserAuthToken::SendMail.call(user)
    end
    success_result
  end

  private

  attr_reader :user_params
end
