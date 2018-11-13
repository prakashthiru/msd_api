class Api::V1::AnalyticsController < ApplicationController

  swagger_controller :analytics, "Analytics Management"

  swagger_api :recent_item do
    summary 'getRecentItem'
    notes 'returns the most recent item added on the given date. ex: 2017-02-03'
    param :query, :date, :string, :required, 'date'
    response :ok
    response :forbidden
  end

  def recent_item
    data = MsdApi::RedisRecentAnalytics.hgetall(epoch_date)
    @result = OpenStruct.new(data)
  end

  swagger_api :brands_count do
    summary 'getBrandsCount'
    notes 'returns the count of each brands added on the given date. ex: 2017-02-03'
    param :query, :date, :string, :required, 'date'
    response :ok
    response :forbidden
  end

  def brands_count
    result = []
    data = MsdApi::RedisCountAnalytics.hgetall(epoch_date)
    data.each { |k,v| result << { brand: k, count: v.to_i } }

    render json: result, status: :ok
  end

  private

  def epoch_date
    Date.strptime(params[:date], '%d-%m-%Y').to_time.to_i
  end
end