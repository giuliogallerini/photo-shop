# app/controllers/api/authentication_controller.rb

class Api::AuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end