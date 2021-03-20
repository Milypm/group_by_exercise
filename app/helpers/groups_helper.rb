module GroupsHelper
  def check_gexercises_empty
    render 'gexercises_noempty' unless @groups.empty?

    render 'empty'
  end

  def check_groupindex_empty
    render 'empty' unless Group.first

    render 'group_noempty'
  end
end
