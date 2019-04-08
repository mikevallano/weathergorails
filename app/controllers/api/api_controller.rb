class Api::ApiController < ApplicationController
  before_action :set_request_format
  before_action :authenticate_token!

  private

  def set_request_format
    request.format = :json
  end

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload['sub'])
    rescue JWT::DecodeError
      render json: {error: ['Invalid token'], status: :unauthorized}
    rescue JWT::ExpiredSignature
      render json: {error: ['Expired token'], status: :unauthorized}
    rescue JWT::InvalidPayload
      render json: {error: ['Invalid token'], status: :unauthorized}
  end

  def auth_token
    @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
    # format passed is 'Authorization: Bearer encodedtokenhere', so the last item will be the token itself
  end
end
