ActiveAdmin.register Profile do

  form :partial => "form"

  index do 
    selectable_column
    column :name
    column :avatar
    column :facebook
    column :linkedin
    column :twitter
    column :biography do |profile|
      truncate(strip_tags(profile.biography).html_safe, :length => 200, :separator => ' ').html_safe
    end
    default_actions
  end
end
