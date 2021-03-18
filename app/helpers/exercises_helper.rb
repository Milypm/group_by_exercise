module ExercisesHelper
  def check_index_empty
    render 'no_empty' unless @exercises.empty?

    render 'empty'
  end

  def index_show_groupicon
    return unless current_page?(controller: 'exercises', action: 'index')

    raw("<div class='group-icon'></div>")
  end
end
