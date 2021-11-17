ActiveAdmin.register User do
  filter :username
  actions :index, :show, :destroy
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :username, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    id_column
    column :username do |user|
      link_to user.username, admin_user_path(user)
    end
    column '# favorited movies' do |user|
      user.favorites.count
    end
    actions  defaults: false do |user|
      item "Delete", admin_user_path(user), method: :delete, class: "member_link", confirm: 'Deleted user forever?'
    end
  end



  show do
    h3 "USERNAME: #{user.username}"
    h3 do
      div "# favorited movies: #{user.favorites.count}"
    end
  end

end
