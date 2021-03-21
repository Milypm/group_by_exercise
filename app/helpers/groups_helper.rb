module GroupsHelper
  def check_gexercises_empty
    render 'empty' unless Group.first.exists?

    render 'gexercises_noempty'
  end

  def check_groupindex_empty
    render 'empty' if @groups.nil?

    render 'group_noempty'
  end
end
