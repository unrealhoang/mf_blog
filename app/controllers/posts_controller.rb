class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @query = params[:query]
    if @query
      @posts = Post.simple_search(@query, params[:page])
    else
      @posts = custom_post_paginate(Post.non_top, (params[:page] || "1").to_i)

      @top_articles = Post.top_articles
      @first_three = Post.non_top.limit(3)
      @popular_posts = Post.unscoped.popular
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @post.view_count = @post.view_count + 1
    @post.save!

    @popular_posts = @post.popular_posts_same_category
    @related_posts = @post.related_posts.all
    @tags = @post.tags

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
