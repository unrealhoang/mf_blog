ActiveAdmin.register Profile do
  form do |f|
    f.inputs "Info" do
      f.input :name
      f.input :avatar
      f.input :facebook
      f.input :facebook_url
      f.input :linkedin
      f.input :linkedin_url
      f.input :twitter
    end
    f.inputs "Biography" do
      f.input :biography, :input_html => { :class => 'ckeditor', :style => "display: inline-block" }
    end
    f.actions
  end
end
