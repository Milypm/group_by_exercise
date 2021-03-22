class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_out
  helper_method :exercise_group_time
  helper_method :exercise_nogroup_time

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
  end

  def exercise_group_time
    time_counter = 0
    Exercise.with_group.each do |e|
      time_counter += e.time
    end
    if time_counter > 60
      hours = (time_counter / 60).floor
      minutes = time_counter % 60
      "#{hours} hours #{minutes} minutes"
    else
      "#{time_counter} minutes"
    end
  end

  def exercise_nogroup_time
    time_counter = 0
    Exercise.without_group.each do |e|
      time_counter += e.time
    end
    if time_counter > 60
      hours = (time_counter / 60).floor
      minutes = time_counter % 60
      "#{hours} hours #{minutes} minutes"
    else
      "#{time_counter} minutes"
    end
  end
end
