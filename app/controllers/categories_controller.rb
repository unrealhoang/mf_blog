class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    @first_three = @category.posts.limit(3)
    @popular_posts = @category.posts.popular

    @posts = custom_post_paginate(@category.posts, (params[:page] || "1").to_i)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
