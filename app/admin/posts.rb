ActiveAdmin.register Post do

  scope_to do
    Class.new do
      def self.posts
        Post.unscoped
      end
    end
  end

  index do 
    selectable_column
    column :title
    column :category
    column :author
    column :image
    column :is_top_article
    column :top_article_image
    column :content do |post|
      truncate(strip_tags(post.content).html_safe, :length => 200, :separator => ' ').html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :category
      f.input :image
      f.input :is_top_article
      f.input :top_article_image
      f.input :tags, :as => :string, :input_html => { :value => f.object.tags.map { |t| t.name }.join(',') }, :hint => 
        f.template.content_tag(:div, "", :id => "tag-list-data", "data-tag-list" => Tag.select(:name).map { |t| t.name }.to_json )
    end
    f.inputs "Content" do
      f.input :content, :input_html => { :class => 'ckeditor', :style => "display: inline-block" }
    end
    f.actions
  end

  controller do
    def create
      @post = Post.new(params[:post])
      @post.author = current_admin_user.profile
      create!
    end
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
      row :top_article_image
    end

    active_admin_comments
  end
  
end
