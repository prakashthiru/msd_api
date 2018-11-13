class Api::V1::AnalyticsController < ApplicationController

  swagger_controller :analytics, "Analytics Management"

  swagger_api :example do
    summary 'Testing end point'
    response :ok
    response :forbidden
  end

  def example
    head :ok
  end

end