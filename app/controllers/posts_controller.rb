class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @query = params[:query]
    if @query
      @posts = Post.simple_search(@query, params[:page])
      add_breadcrumb "Search for \"#{@query}\"" 
    else
      @posts = Post.non_top.paginate(:page => params[:page]).offset(3)
      logger.debug @posts.select(:id).to_json

      @top_articles = Post.top_articles
      @first_three = Post.non_top.limit(3)
      @popular_posts = Post.popular
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

    @popular_posts = @post.category.posts.popular

    add_breadcrumb_for_category @post.category
    add_breadcrumb @post.title, post_path(@post)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
