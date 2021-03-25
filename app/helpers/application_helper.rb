module ApplicationHelper
  def root_page
    if logged_in?
      render 'users/profile'
    else
      render 'home/not_logged'
    end
  end

  def alerts
    render 'layouts/alerts' if notice && !current_page?(login_path)
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

    nil
  end

  def get_icon_exercise(exercise)
    return if exercise.group_id.nil?

    group_icon = Group.find_by(id: exercise.group_id).icon
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
