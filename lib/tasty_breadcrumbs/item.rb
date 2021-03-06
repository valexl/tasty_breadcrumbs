class TastyBreadcrumbs::Item
  attr_reader :title
  def initialize(title, url_or_route_helper_method)
    @title = title.to_s
    @url_or_route_helper_method  = url_or_route_helper_method
  end

  def url
    return @url_or_route_helper_method if @url_or_route_helper_method.instance_of?(String)
    Rails.application.routes.url_helpers.send(@url_or_route_helper_method)
  end
  
end