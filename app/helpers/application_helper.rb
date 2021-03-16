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
end
