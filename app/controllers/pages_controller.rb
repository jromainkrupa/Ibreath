class PagesController < ApplicationController
  def home
    if current_user
      case
      when current_user.user_status == "created"
        redirect_to :pairing
      when current_user.user_status == "pairing_done" || current_user.user_status == "in_prepwork"
        redirect_to :prepwork
      when current_user.user_status == "ready_to_launch"
        redirect_to :prepwork_results
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
    #redirect_to root_path unless current_user.prepwork_results?
    @daily_program_smokes = get_smoking_program(current_user)

    render "pages/my_program"
  end

  def daily_program
    render "pages/daily_program"
  end

  private

  def get_smoking_program(current_user)
    total_smoke = Smoke.where(user: current_user).count
    program_date_launch = Program.where(user: current_user).first.start_time
    first_smoke_date = Smoke.where(user: current_user).first.created_at.to_datetime
    day_of_prepwork = (program_date_launch - first_smoke_date).round
    average_smoke = (total_smoke / day_of_prepwork).round
    daily_program_smokes = [average_smoke]
    30.times do |i|
      daily_program_smokes << (-average_smoke.fdiv(30) * (i + 1) + average_smoke).round
      i += 1
    end
    return daily_program_smokes
  end

end
