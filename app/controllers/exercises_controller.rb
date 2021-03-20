class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  before_action :all_exercises, only: %i[ index index_nogroup ]

  def index
    @exercises_w_group = all_exercises.with_group
  end

  def index_nogroup
    @exercises_no_group = all_exercises.without_group
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = current_user.exercises.create(exercise_params)
    respond_to do |format|
      if @exercise.save
        format.html { redirect_to exercises_path, notice: "Exercise was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def all_exercises
    @exercises = Exercise.all
  end

  def exercise_params
    params.require(:exercise).permit(:name, :time, :user_id, :group_id)
  end
end
