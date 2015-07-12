class Api::V1::BaseController < ApplicationController

  # for public api
  skip_before_filter :verify_authenticity_token

  # respond all actions to json format
  respond_to :json

end
