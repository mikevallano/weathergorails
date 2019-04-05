class Api::V1::AuthenticationController < Api::ApiController
  skip_before_action :verify_authenticity_token # not needed because it's an API, not a form
  skip_before_action :authenticate_token! # not needed because there is no token yet

  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password?(params[:user][:password])
      render json: {token: JsonWebToken.encode(sub: user.id)}
    else
      render json: {errors: ['Invalid email or password']}
    end
  end
end
