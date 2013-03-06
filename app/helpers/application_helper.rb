module ApplicationHelper
  def request_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def add_breadcrumb_for_category(category)
    add_breadcrumb_for_category category.parent_category if !category.parent_category.nil?
    add_breadcrumb category.name, category_path(category)
  end
end
