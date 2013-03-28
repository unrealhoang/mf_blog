class HomeController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def jobs
    @jobs = StaticPage.where(:name => "jobs").first
  end
end
