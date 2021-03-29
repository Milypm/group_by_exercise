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

  def show_edit_btn(group)
    return unless current_user.id == group.user_id

    link_to edit_group_path(group.id) do
      raw("<i class='fas fa-pen'></i>")
    end
  end

  def show_delete_btn(group)
    return unless current_user.id == group.user_id

    link_to group_path(group.id), method: :delete, data: { confirm: 'Delete this group?' } do
      raw("<i class='far fa-trash-alt'></i>")
    end
  end
end
