module UsersHelper
  def user_avatar(current_user)
    user = User.find(current_user.id)
    if user.user_image.attached?
      image_tag user.user_image
    else
      image_tag 'default_user_image.jpg'
    end
  end

  def check_user_logged
    render 'layouts/header_notlogged' unless logged_in?

    render 'layouts/header_logged'
  end
end
