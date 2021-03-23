module GroupsHelper
  def check_groupindex_empty
    render 'empty' if @groups.nil?

    render 'group_noempty'
  end
  
  def check_gexercises_empty
    render 'empty' if @group_exercises.nil?

    render 'gexercises_noempty'
  end

  def show_edit_del_btns(group)
    return unless current_user.id == group.user_id

    render 'groups/edit_delete_btns'
  end
end
