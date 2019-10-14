require 'rest-client'
require 'json'
require_relative './abstract_service'
class RestClientService < AbstractService
  ALLOWED_KEYS = %i(method url payload header)
  attr_accessor :base_url

  def initialize(base_url)
    @base_url = base_url
  end

  private

  def request(options)
    # need to process the options
    options[:url] = full_url_for(options[:url])
    selected_options = options.slice(*ALLOWED_KEYS)

    response = RestClient::Request.execute(selected_options)
    parsed_response(response)
  rescue RestClient::ExceptionWithResponse => exception
    parsed_exception(exception)
  end

  def full_url_for(url)
    base_url + url
  end

  # RestClient::Request.execute(method: :get, url: 'http://example.com/resource',
  # timeout: 10, headers: {params: {foo: 'bar'}})
  # RestClient::Request.execute(
  #   method: :delete,
  #   url: 'http://example.com/resource',
  #   payload: 'foo',
  #   headers: {myheader: 'bar'})
end