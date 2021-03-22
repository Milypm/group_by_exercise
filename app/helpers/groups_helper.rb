module GroupsHelper
  def check_gexercises_empty
    render 'empty' if @group_exercises.nil?

    render 'gexercises_noempty'
  end

  def check_groupindex_empty
    render 'empty' if @groups.nil?

    render 'group_noempty'
  end

  def author(exercise)
    User.find_by(id: Exercise.find_by(id: exercise.id).user_id).name
  end
end
