ActiveAdmin.register Post do
  index do 
    column :title
    column :category
    column :image
    column :is_top_article
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
      f.input :tags
    end
    f.inputs "Content" do
      f.input :content, :input_html => { :class => 'ckeditor', :style => "display: inline-block" }
    end
    f.actions
  end
  
end
