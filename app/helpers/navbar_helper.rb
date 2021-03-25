module NavbarHelper
  def nav_logged_title
    if !logged_in?
      nav_notlogged_title
    elsif params[:controller] == 'exercises'
      params_exercises_controller
    elsif params[:controller] == 'groups'
      params_groups_controller
    else
      'EDIT PROFILE'
    end
  end

  def nav_show_logoutbtn
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      link_to 'Log Out', logout_path, method: :post
    elsif params[:controller] == 'groups' && params[:action] == 'show'
      link_to 'Log Out', logout_path, method: :post
    end
  end

  private

  def nav_notlogged_title
    if current_page?(new_user_path)
      'REGISTER'
    else
      'LOGIN'
    end
  end

  def params_exercises_controller
    if current_page?(exercises_path)
      'MY EXERCISES'
    elsif current_page?(external_exercises_path)
      'MY EXTERNAL EXERCISES'
    elsif current_page?(new_exercise_path)
      'ADD NEW EXERCISE'
    elsif params[:action] == 'edit'
      'EDIT EXERCISE'
    end
  end

  def params_groups_controller
    if current_page?(new_group_path)
      'ADD NEW GROUP'
    elsif params[:action] == 'show'
      @group.name.upcase.to_s
    elsif params[:action] == 'edit'
      'EDIT GROUP'
    end
  end
end