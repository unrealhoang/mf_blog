ActiveAdmin.register Post do
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
