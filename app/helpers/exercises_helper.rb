module ExercisesHelper
  def check_index_empty
    if @exercises_w_group.empty?
      render 'empty'
    else
      render 'withgroup_no_empty'
    end
  end

  def check_indexnogroup_empty
    if @exercises_no_group.empty?
      render 'empty'
    else
      render 'withoutgroup_no_empty'
    end
  end
end
