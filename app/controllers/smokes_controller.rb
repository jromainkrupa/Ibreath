class SmokesController < ApplicationController
  def new
  end

  def create
    @user = current_user
    Smoke.create({user: @user})
    redirect_to add_a_cigarette_path
  end

  def destroy
    @smoke = Smoke.last
    @smoke.destroy
    redirect_to add_a_cigarette_path
  end
end
