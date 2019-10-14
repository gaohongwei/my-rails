# require 'faraday'
require 'json'
require_relative './abstract_service'
class FaradayService < AbstractService
  attr_accessor :client

  def initialize(endpoint)
    @client = Faraday.new(url: endpoint) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.options[:open_timeout] = 2
      faraday.options[:timeout] = 10
    end
  end

  private

  def request(method:, url:, payload:, header:)
    response = client.send(method, url, payload, header)
    parsed_response(response)
  rescue Faraday::Error => exception
    parsed_exception(exception)
  end

end


