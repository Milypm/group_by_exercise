module NavbarleftHelper
  def nav_check_icon
    if logged_in?
      left_icon_logged
    else
      if current_page?(login_path) || current_page?(new_user_path)
        link_to root_path do
          raw("<i class='fas fa-arrow-left'></i>")
        end
      end
    end
  end

  def left_icon_logged
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      render 'exercises/header_dropdown'
    elsif current_page?(groups_path)
      render 'exercises/header_dropdown'
    else
      link_to url_for(:back) do
        raw("<i class='fas fa-arrow-left'></i>")
      end
    end
  end
end
