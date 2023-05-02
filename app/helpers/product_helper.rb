require 'net/http'
module ProductHelper

  def check_image(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    if response.code == '200'
      return true
    else
      return false
    end
  rescue
    return false
  end

end
