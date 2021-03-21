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

  def dropdown_two
    if current_page?(external_exercises_path) || current_page?(groups_path)
      link_to 'My Exercises', exercises_path
    elsif current_page?(exercises_path)
      link_to 'My External Exercises', external_exercises_path
    elsif current_page?(group_exercises_path)
      link_to 'My Groups', groups_path
    end
  end

  def dropdown_three
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      link_to 'My Groups', groups_path
    elsif current_page?(groups_path)
      link_to 'My External Exercises', external_exercises_path
    end
  end

  def dropdown_four
    link_to 'Log Out', logout_path, method: :post if current_page?(groups_path)

    return
  end

  def nav_notlogged_title # define which title to display on '_header_notlogged' navbar
    if current_page?(new_user_path)
      'REGISTER'
    else
      'LOGIN'
    end
  end

  def nav_check_icon
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      render 'exercises/header_dropdown'
    elsif current_page?(groups_path)
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

  def nav_show_logoutbtn
    if current_page?(exercises_path) || current_page?(external_exercises_path)
      link_to 'Log Out', logout_path, method: :post, class: 'nav-logout-btn'
    elsif current_page?(group_exercises_path)
      link_to 'Log Out', logout_path, method: :post, class: 'nav-logout-btn'
    else
      return
    end
  end
  
  def get_icon_exercise(exercise)
    group = Group.find_by(id: exercise.group_id, user_id: exercise.user_id).name
    groupname_icon[group]
  end

  def get_icon_group(group)
    name = group.name
    groupname_icon[name]
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

  def list_of_icons
    %w[None Cardio-running Cardio-walking Cardio-other Strenght-tone-up Flexibility]
  end
end
