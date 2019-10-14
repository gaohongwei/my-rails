# require 'faraday'
require 'json'
class BaseServiceBak
  HTTP_OK = 200

  attr_accessor :client

  def initialize(endpoint:)
    @client = Faraday.new(url: endpoint) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.options[:open_timeout] = 2
      faraday.options[:timeout] = 10
    end
  end

  def get_request(endpoint, payload = {}, header = default_header)
    request(http_method: :get, endpoint: endpoint, payload: payload, header: header)
  end

  def post_request(endpoint, payload = {}, header = default_header)
    request(http_method: :post, endpoint: endpoint, payload: payload)
  end

  def delete_request(endpoint, payload = {}, header = default_header)
    request(http_method: :delete, endpoint: endpoint, payload: payload)
  end

  private

  def request(http_method:, endpoint:, payload:, header:)

    response = client.send(http_method, endpoint, payload, header)

    if response.status == HTTP_OK
      body = JSON.parse(response.body)
      {status: response.status, body: body}
    else
      {status: response.status, error: response.body}
    end
  rescue Faraday::Error => e
    {status: 500, error: e.message}
  end

  def default_header
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  # def query_path( query = {})
  #   query_string = query.map{|k,v| "#{k}=#{v}"}.join("&")
  #   query.empty?? base_endpoint : "#{base_endpoint}?#{query_string}"
  # end
end


