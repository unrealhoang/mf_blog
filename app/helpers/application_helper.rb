module ApplicationHelper
  def request_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end
end
