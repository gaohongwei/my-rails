require_relative 'common/faraday_service'
class MyService <  FaradayService
  API_ENDPOINT = 'https://sunpower-prod-dgplatform-spectrum.s3.amazonaws.com'
  URL_FORMAT = '/DocGen-Request-%s.json'

  def initialize
    super(endpoint: API_ENDPOINT)
  end

  def get
    url = get_url('0Q02T0000030hmUSAQ')
    response = get_request(url)
    data = response.body['body']["nameValuePairs"]
    data
  end

  def get_url(id)
    URL_FORMAT % id
  end
end
