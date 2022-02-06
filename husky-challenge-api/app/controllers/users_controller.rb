class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update ]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    create_user = CreateUser.call(user_params)

    render json: create_user.result, status: create_user.success? ? :created : :unprocessable_entity
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
