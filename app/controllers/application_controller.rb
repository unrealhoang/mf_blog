class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_main_categories
  before_filter :prepare_breadcrumb

  def prepare_breadcrumb
    add_breadcrumb "Home", :root_path
  end

  def add_breadcrumb_for_category(category)
    add_breadcrumb_for_category category.parent_category if !category.parent_category.nil?
    add_breadcrumb category.name, category_path(category)
  end

  def load_main_categories
    @main_categories = Category.where(:parent_category_id => nil)
  end

  def custom_post_paginate(posts, cur_page)
    WillPaginate::Collection.create(cur_page, Post.per_page) do |pager|
        result = posts.limit(pager.per_page).offset(pager.offset + 3)
        # inject the result array into the paginated collection:
        pager.replace(result)

        pager.total_entries = posts.count - 3
      end
  end
end
