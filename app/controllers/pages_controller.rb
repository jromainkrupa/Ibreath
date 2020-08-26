class PagesController < ApplicationController
  def home
    if current_user
      case
      when current_user.user_status == "created"
        redirect_to :pairing
      when current_user.user_status == "pairing_done" || current_user.user_status == "in_prepwork"
        redirect_to :prepwork
      when current_user.user_status == "in_program"
        redirect_to :my_program
      else
        render :home
      end
    else
      redirect_to :about_us
    end
  end

  def pairing
    redirect_to root_path unless current_user.created?

    render "pages/pairing"
  end

  def about_us
    render "pages/about_us"
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
    render "pages/my_program"
  end

  private

  def check_user_state(current_user)
    if current_user
      case
      when current_user.user_status == "created"
        redirect_to :pairing
      when current_user.user_status == "pairing_done" || current_user.user_status == "in_prepwork"
        redirect_to :prepwork
      when current_user.user_status == "in_program"
        redirect_to :my_program
      else
        render :home
      end
    else
      render :home
    end

  end

end
