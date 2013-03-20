ActiveAdmin.register Category do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :parent_category, :collection => Category.hierachized_list
    end
    f.actions
  end
end
