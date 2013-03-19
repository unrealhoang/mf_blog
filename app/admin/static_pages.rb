ActiveAdmin.register StaticPage do
  actions :all, :except => [:destroy]

  form do |f|
    f.inputs "Content" do
      f.input :content, :input_html => { :class => 'ckeditor', :style => "display: inline-block" }
    end
    f.actions
  end
end
