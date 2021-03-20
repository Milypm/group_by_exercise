module ExercisesHelper
  def check_index_empty
    render 'empty' unless @exercises_w_group.first

    render 'withgroup_no_empty'
  end

  def check_indexnogroup_empty
    render 'empty' unless @exercises_no_group.first
    
    render 'withoutgroup_no_empty'
    end
end
