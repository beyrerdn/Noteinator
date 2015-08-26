class Api::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    @user.api_token = Faker::Bitcoin.testnet_address
    @user.save!
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  private

  def user_params
    params.permit(:email)
  end

end
