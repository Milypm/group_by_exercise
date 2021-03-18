module GroupsHelper
  def check_gexercises_empty
    render 'gexercises_noempty' unless @exercises.empty?

    render 'exercises/empty'
  end

  def check_groupindex_empty
    render 'group_noempty' unless @exercises.empty?

    render 'exercises/empty'
  end

  def group_index_header
    render 'exercises/index_header' unless current_page?(controller: 'groups')
    
    render 'groups/index_groupname'
  end
end
