ActiveAdmin.register Post do

  index do 
    selectable_column
    column :title
    column :category
    column :author
    column :image
    column :is_top_article
    column :view_count
    column :content do |post|
      truncate(strip_tags(post.content).html_safe, :length => 200, :separator => ' ').html_safe
    end
    default_actions
  end

  form :partial => "form"

  controller do
    def create
      @post = Post.new(params[:post])
      @post.author = current_admin_user.profile
      create!
    end
  end

  action_item :only => :show do
    link_to "New Post", new_admin_post_path
  end

  show do |post|
    attributes_table do 
      row :title
      row :content do 
        link_to post.title, post_path(post)
      end
      row :author
      row :category
      row :image
      row :is_top_article
      row :view_count
    end

    active_admin_comments
  end
  
end
