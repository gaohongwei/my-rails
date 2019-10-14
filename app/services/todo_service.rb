require_relative 'common/rest_client_service'
class TodoService <  RestClientService
  API_ENDPOINT = 'http://127.0.0.1:3000'

  def initialize
    super(API_ENDPOINT)
  end

  def index
    url = '/api/v1/todos'
    data = get_request(url)
    byebug
    data
  end


  def get
    url = get_url('0Q02T0000030hmUSAQ')
    response = get_request(url)

    data = response[:body]['body']["nameValuePairs"]
    data
  end

  def get_url(id)
    URL_FORMAT % id
  end
end