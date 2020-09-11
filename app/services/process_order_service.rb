# frozen_string_literal: true

class ProcessOrderService < BaseService
  URL = URI(ENV['API_URL']).freeze

  def call(payload)
    response = connection.request(request(payload))

    respose.code == '200' ? true : false
  end

  private

  def request(body)
    req = Net::HTTP::Post.new(URL.path)
    req["Content-Type"] = "application/json"
    req['X-Sent'] = Time.zone.now.strftime("%Hh%M - %d/%m/%y")
    req.body = body
    req
  end

  def connection
    http = Net::HTTP.new(URL.host, URL.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end
