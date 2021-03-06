ActiveAdmin.register AdminUser do     
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    column :profile
    column :is_active
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :profile
      f.input :is_active
    end                               
    f.actions                         
  end                                 

  controller do
    def update
      if params[:admin_user][:password].blank?
        [:password, :password_confirmation].collect { |p| params[:admin_user].delete(p) }
      end

      update!
    end
  end
end                                   
