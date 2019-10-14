module Api::V1
  class WeathersController < ActionController::API
    def index
      city_name = params[:city]
      limit = params[:limit].to_i
      limit = limit.zero? ? 10 : limit
      city = City.by_name(city_name)
      @weathers = city&.weathers&.recent(limit)
      total_count = @weathers.blank? ? 0 : @weathers.count
      render json: {city: city_name, total_count: total_count, rows: @weathers}
    end
  end
end


