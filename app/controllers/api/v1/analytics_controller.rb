class Api::V1::AnalyticsController < ApplicationController

  swagger_controller :analytics, "Analytics Management"

  swagger_api :recent_item do
    summary 'getRecentItem'
    notes 'returns the most recent item added on the given date. ex: 2017-02-03'
    param :query, :date, :string, :required, 'date'
    response :ok
    response :forbidden
  end

  # GET /recent_item with 'date' (for /getRecentItem)
  def recent_item
    raise MsdApi::Exception::InvalidParameter.new(_('errors.missing_param', key: :date)) unless params[:date]

    begin
      data = MsdApi::RedisRecentAnalytics.hgetall(epoch_date)
      @item = OpenStruct.new(data)
    rescue Exception => e
      render_error_json(_('errors.invalid_date'))
    end
  end

  swagger_api :brands_count do
    summary 'getBrandsCount'
    notes 'returns the count of each brands added on the given date. ex: 2017-02-03'
    param :query, :date, :string, :required, 'date'
    response :ok
    response :forbidden
  end

  # GET /brands_count with 'date' (for /getBrandsCount)
  def brands_count
    raise MsdApi::Exception::InvalidParameter.new(_('errors.missing_param', key: :date)) unless params[:date]
    result = []

    begin
      data = MsdApi::RedisCountAnalytics.hgetall(epoch_date)
      data.each { |k,v| result << { brand: k, count: v.to_i } }
      render json: { stats: result }, status: :ok
    rescue Exception => e
      render_error_json(_('errors.invalid_date'))
    end

  end

  swagger_api :items_by_color do
    summary 'getItemsbyColor'
    notes 'returns the top 10 latest items given input as color. ex: black'
    param :query, :color, :string, :required, 'color'
    response :ok
    response :forbidden
  end

  # GET /items_by_color with 'color' (for /getItemsbyColor)
  def items_by_color
    raise MsdApi::Exception::InvalidParameter.new(_('errors.missing_param', key: :color)) unless params[:color]

    begin
      data = MsdApi::RedisColorAnalytics.lrange(params[:color].downcase, 0, -1)
      result = data.map {|x| JSON.parse x.gsub(/\"/, %q('))
                          .gsub(/\su'/, "\s'")
                          .gsub(/(\W)(')/) { "#$1\"" }
                          .gsub(/(')(\W)/) { "\"#$2" }
                        }
      @items = result.sort_by! { |x| x['dateAdded'] }.reverse.first(10)

    rescue JSON::ParserError => e
      render_error_json(_('errors.data_parse_error'))
    end

  end

  private

  def epoch_date
    Date.strptime(params[:date], '%d-%m-%Y').to_time.to_i
  end
end