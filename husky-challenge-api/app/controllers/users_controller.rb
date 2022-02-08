class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update ]
  skip_before_action :validate_token

  def show
    render json: @user
  end

  def create
    create_user = CreateUser.call(user_params)

    render json: create_user.result, status: create_user.success? ? :created : :unprocessable_entity
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
