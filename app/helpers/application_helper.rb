module ApplicationHelper
  def root_page
    if logged_in?
      render 'users/profile' 
    else
      render 'home/not_logged'
    end
  end

  def alerts
    render 'layouts/alerts' if notice
  end

  def dropdown_one
    if @user && current_page?(user_path(@user))
      link_to 'Edit', edit_user_path(current_user.id)
    else
      link_to 'My Profile', user_path(current_user.id)
    end
  end

  def dropdown_two
    if current_page?(external_exercises_path) || current_page?(groups_path)
      link_to 'My Exercises', exercises_path
    elsif current_page?(exercises_path)
      link_to 'My External Exercises', external_exercises_path
    elsif @user && current_page?(user_path(@user))
      link_to 'Log Out', logout_path, method: :post
    else
      link_to 'All Groups', groups_path
    end
  end

  def dropdown_three
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      link_to 'All Groups', groups_path
    elsif current_page?(groups_path)
      link_to 'My External Exercises', external_exercises_path
    end
  end

  def dropdown_four
    link_to 'Log Out', logout_path, method: :post if current_page?(groups_path)

    return
  end

  def nav_notlogged_title
    if current_page?(new_user_path)
      'REGISTER'
    else
      'LOGIN'
    end
  end

  def nav_check_icon
    if logged_in?
      if current_page?(new_exercise_path) || current_page?(new_group_path)
        link_to exercises_path do
          raw("<i class='fas fa-arrow-left'></i>")
        end
      elsif params[:action] == 'edit' || params[:controller] == 'groups' && params[:action] == 'show'
        link_to exercises_path do
          raw("<i class='fas fa-arrow-left'></i>")
        end
      else
        render 'exercises/header_dropdown'
      end
    else
      link_to root_path do
        raw("<i class='fas fa-arrow-left'></i>")
      end
    end
  end

  def nav_logged_title
    if current_page?(login_path)
      'LOGIN'
    elsif current_page?(new_user_path)
      'REGISTER'
    elsif current_page?(exercises_path)
      'MY EXERCISES'
    elsif current_page?(external_exercises_path)
      'MY EXTERNAL EXERCISES'
    elsif current_page?(new_exercise_path)
      'ADD NEW EXERCISE'
    elsif current_page?(new_group_path)
      'ADD NEW GROUP'
    elsif params[:controller] == 'exercises' && params[:action] == 'edit'
      'EDIT EXERCISE'
    elsif params[:controller] == 'groups' && params[:action] == 'show'
      "#{@group.name.upcase}"
    elsif params[:controller] == 'groups' && params[:action] == 'edit'
      'EDIT GROUP'
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
  
  def get_icon_exercise(exercise)
    return unless exercise.group_id != nil
    
    group_icon = Group.find_by(id: exercise.group_id, user_id: exercise.user_id).icon
    raw(group_icon)
  end

  def groupname_icon
    {
      'Cardio-running' => raw("<i class='fas fa-running'></i>"),
      'Cardio-walking' => raw("<i class='fas fa-walking'></i>"),
      'Cardio-other' => raw("<i class='fas fa-biking'></i>"),
      'Strenght-tone-up' => raw("<i class='fas fa-dumbbell'></i>"),
      'Flexibility' => raw("<i class='fas fa-skating'></i>")
    }
  end
end
