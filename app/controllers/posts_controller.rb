class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index
    @query = params[:query]
    if @query
      @posts = Post.simple_search(@query, params[:page])
      add_breadcrumb "Search for \"#{@query}\"" 
    else
      @posts = WillPaginate::Collection.create((params[:page] || "1").to_i, Post.per_page) do |pager|
        result = Post.non_top.limit(pager.per_page).offset(pager.offset + 3)
        # inject the result array into the paginated collection:
        pager.replace(result)

        pager.total_entries = Post.non_top.count - 3
      end

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

    @popular_posts = @post.category.posts.unscoped.where("id != ?", @post.id).popular

    add_breadcrumb_for_category @post.category
    add_breadcrumb @post.title, post_path(@post)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
