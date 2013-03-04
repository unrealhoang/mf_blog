class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_main_categories
  before_filter :prepare_breadcrumb

  def prepare_breadcrumb
    add_breadcrumb "Mobifood", :root_path
  end

  def load_main_categories
    @main_categories = Category.where(:parent_category_id => nil)
  end
end
