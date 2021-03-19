module ApplicationHelper
  def root_page # define which main page to display
    if logged_in?
      render 'users/profile' 
    else
      render 'home/not_logged'
    end
  end

  def alerts
    render 'layouts/alerts' if notice
  end

  def nav_notlogged_title # define which title to display on '_header_notlogged' navbar
    if current_page?(controller: 'users', action: 'create')
      'REGISTER'
    else
      'LOGIN'
    end
  end

  def nav_check_icon
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      render 'exercises/header_dropdown'
    elsif current_page?(new_exercise_path) || current_page?(new_group_path)
      link_to exercises_path do
        raw("<i class='fas fa-arrow-left'></i>")
      end
    end
  end

  def nav_logged_title
    if current_page?(exercises_path)
      'MY EXERCISES'
    elsif current_page?(external_exercises_path)
      'MY EXTERNAL EXERCISES'
    elsif current_page?(new_exercise_path)
      'ADD NEW EXERCISE'
    elsif current_page?(new_group_path)
      'ADD NEW GROUP'
    elsif current_page?(group_exercises_path)
      'ADD NEW GROUP'
    end
  end

  def nav_logged_right
    if current_page?(exercises_path)
      current_user.name
    elsif current_page?(external_exercises_path)
      current_user.name
    elsif current_page?(group_exercises_path)
      current_user.name
    else
      return
    end
  end

  def nav_show_logoutbtn
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      link_to 'Log Out', logout_path, method: :post, class: 'nav-logout-btn'
    elsif current_page?(group_exercises_path)
      link_to 'Log Out', logout_path, method: :post, class: 'nav-logout-btn'
    else
      return
    end
  end
end
