module GroupsHelper
  def check_groupindex_empty
    if @groups.empty?
      render 'exercises/empty'
    else
      render 'group_noempty'
    end
  end

  def check_gexercises_empty
    if @group_exercises.empty?
      render 'exercises/empty'
    else
      render 'gexercises_noempty'
    end
  end

  def author(exercise)
    User.find_by(id: Exercise.find_by(id: exercise.id).user_id).name
  end
end
