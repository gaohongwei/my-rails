class AbstractService
  HTTP_OK = 200

  # We 4 keys
  # method, url, payload, header
  def get_request(url, payload: nil, header: default_header)
    request(method: :get, url: url, payload: payload, header: header)
  end

  def post_request(url, payload: nil, header: default_header)
    request(method: :post, url: url, payload: payload, header: header)
  end

  def delete_request(url, payload: nil, header: default_header)
    request(method: :delete, url: url, payload: payload, header: header)
  end

  private

  def response_code(response)
    %i(code status).each do|key|
      return response.send(key) if response.respond_to?(key)
    end
  end

  def parsed_response(response)
    code = response_code(response)
    body = response.body
    body = JSON.parse(body)
    return {body: body, code: code}
  rescue
    return {body: body, code: code}
  end

  def parsed_exception(exception)
    {code: 500, body: exception.message}
  end

  def default_header
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end
end


