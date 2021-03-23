class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_out
  helper_method :exercise_group_time
  helper_method :exercise_nogroup_time
  helper_method :group_exercises_time
  # helper_method :generate_avatar

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
    @time_counter = 0
    @exercises_w_group.each do |e|
      @time_counter += e.time
    end
    get_hours_mins
  end

  def exercise_nogroup_time
    @time_counter = 0
    @exercises_no_group.each do |e|
      @time_counter += e.time
    end
    get_hours_mins
  end

  def group_exercises_time
    @time_counter = 0
    @group_exercises.each do |e|
      @time_counter += e.time
    end
    get_hours_mins
  end

  # def generate_avatar
  #   random_n = rand(1..4)
  #   helpers.avatar_images.select { |k, v| k == random_n}
  # end

  private

  def get_hours_mins
    if @time_counter > 60
      hours = (@time_counter / 60).floor
      minutes = @time_counter % 60
      "#{hours} hr #{minutes} min"
    else
      "#{@time_counter} min"
    end
  end
end
