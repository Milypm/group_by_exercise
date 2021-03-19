class GroupsController < ApplicationController
  before_action :set_group, only: %i[ edit update destroy ]
  before_action :icons, only: %i[ new create edit update ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all.includes(:user)
  end

  def index_groupexercises(group)
    @group_exercises = Group.find_by(id: group).exercises
    @exercise_creator = User.find_by(id: (Exercise.find_by(id: @group.exercise_id, user_id: @group.user_id).user_id))
  end
  # GET /groups/1 or /groups/1.json
  def show
    @groups = Group.all.includes(:user)
    # @groups_all = Group.any?
    @group = Group.find_by(id: params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.create(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id, :exercise_id)
  end

  def icons
    @group_icons = list_of_icons
  end
end
