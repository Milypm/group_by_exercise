class GroupsController < ApplicationController
  before_action :set_group, only: %i[ edit update destroy ]
  before_action :icons, only: %i[ new create edit update ]

  def index
    @groups = Group.all.order(:name)
  end

  def index_groupexercises(group)
    @group_exercises = Group.find_by(id: group).exercises
    @exercise_creator = User.find_by(id: (Exercise.find_by(id: @group.exercise_id, user_id: @group.user_id).user_id))
  end

  def show
    @groups = Group.all.includes(:user)
    @group = Group.find_by(id: params[:id])
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = current_user.groups.create(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: "Group was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id, :exercise_id)
  end

  def icons
    @group_icons = helpers.groupname_icon
  end
end
