class Merb::Controller
  def recognize_path(path, method = :get)
    uri = URI.parse(path)
    method = method.to_s.upcase
    request = Merb::Request.new(
      Merb::Const::REQUEST_PATH => uri.path,
      Merb::Const::REQUEST_METHOD => method,
      Merb::Const::QUERY_STRING => uri.query)
    Merb::Router.match(request)[1] rescue nil
  end
end
