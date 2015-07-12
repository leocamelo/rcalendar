class Api::V1::BaseController < ApplicationController

  # for public api
  skip_before_filter :verify_authenticity_token

  # set responders modules
  responders :flash, :http_cache

  # respond all actions to json format
  respond_to :json

end
