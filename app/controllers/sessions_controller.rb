class SessionsController < ApplicationController
  def new; end

  def show; end

  def create
    user = User.find_by_name(params[:login][:name])
    if user
      log_in(user)
      redirect_to user_path(current_user.id), notice: 'Succesfully Logged In.'
    else
      redirect_to '/login', notice: 'Invalid username, try again with a valid username.'
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Succesfully Logged Out.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :id)
  end
end
