class ApiController < ApplicationController
  # include Knock::Authenticatable
  before_action :authenticate_user
  before_action :set_request_format

  private

  def set_request_format
    request.format = :json
  end
end
