class Api::ApiController < ApplicationController
  before_action :set_request_format

  private

  def set_request_format
    request.format = :json
  end
end
