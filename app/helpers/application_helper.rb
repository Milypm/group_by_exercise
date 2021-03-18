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

  def nav_notlogged_btn # define which form-button to display on '_header_notlogged' navbar
    if current_page?(controller: 'users', action: 'create')
      'Next'
    else
      'Log In'
    end
  end

  def nav_logged_icon
    if current_page?(controller: 'exercises', action: 'create')
      link_to redirect_back(fallback_location: fallback_location), target: "_blank" do
        raw("<i class='fas fa-arrow-left'></i>")
      end
    end
  end

  def nav_logged_title
    if current_page?(controller: 'exercises', action: 'index')
      'EXERCISES'
    elsif current_page?(controller: 'exercises', action: 'index_nogroup')
      'EXTERNAL EXERCISES'
    elsif current_page?(controller: 'exercises', action: 'create')
      'ADD EXERCISE'
    elsif current_page?(controller: 'groups', action: 'create')
      'CREATE GROUP'
    else
      Group.find_by(user_id: user.id).name
    end
  end

  def nav_logged_right
    return unless current_page?(controller: 'exercises', action: 'index') || 
        current_page?(controller: 'exercises', action: 'index_nogroup')
        
    current_user.name
  end
end
