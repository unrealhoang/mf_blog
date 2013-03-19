class TagsController < ApplicationController
  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
    @first_three = @tag.posts.limit(3)

    @posts = custom_post_paginate(@tag.posts, (params[:page] || "1").to_i)
    @popular_posts = @tag.posts.popular

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end
end
