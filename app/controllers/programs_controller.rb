class ProgramsController < ApplicationController

  def create
    @user = current_user
    @init_smoke = @user.average_smoke
    @start_time = Date.current
    Program.create(user: @user, init_smoke: @init_smoke, start_time: @start_time)
    redirect_to my_program_path(current_user)
  end

  private

  def program_params
    params.require(:program).permit(:user, :init_smoke, :start_time)
  end
end
