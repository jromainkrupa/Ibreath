class PagesController < ApplicationController
  def home
    if current_user
      redirect_to :pairing
    end
  end

  def pairing
    render "pages/pairing"
  end

  def tutorial
    render "pages/tutorial"
  end

  def prepwork
    @smokes = Smoke.where(user_id: current_user.id) # add created add
    render "pages/prepwork"

    # if current_user.created_at > 1 semaine render program is ready
  end

  def program_launch
    render "pages/program_launch"
  end

  def prepwork_results
    render "pages/prepwork_results"
  end

  def my_program
    @program = [15, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 10, 9, 9, 8, 8, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1, 0]

    render "pages/my_program"
  end

end
