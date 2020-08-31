class PagesController < ApplicationController
  ACTION_WITH_SWAG_BUTTONS = %w[home statistics calendar daily_program]

  layout Proc.new { |controller| (controller.action_name.in? ACTION_WITH_SWAG_BUTTONS) ? 'in_program' : 'application' }

  def home
    if current_user
      case
      when current_user.user_status == "created"
        redirect_to :pairing
      when current_user.user_status == "pairing_done" || current_user.user_status == "in_prepwork"
        redirect_to :prepwork
      when current_user.user_status == "ready_to_launch"
        redirect_to :tutorial
      when current_user.user_status == "in_program"
        redirect_to :daily_program
      else
        render :home
      end
    else
      render :home
    end
  end

  def prepwork
    @smokes = Smoke.where(user_id: current_user.id) # add created add
    render "pages/prepwork"

    # if current_user.created_at > 1 semaine render program is ready
  end

  def daily_program
    @ar_program = current_user.program

    # @program_day = get_program_day(current_user)
    # @program = get_smoking_program(current_user)
    render "pages/daily_program"
  end


  private

  # def get_smoking_program(current_user)
  #   total_smoke = Smoke.where(user: current_user).count
  #   program_date_launch = Program.where(user: current_user).first.start_time
  #   first_smoke_date = Smoke.where(user: current_user).first.created_at.to_datetime
  #   day_of_prepwork = (program_date_launch - first_smoke_date).round
  #   average_smoke = (total_smoke / day_of_prepwork).round
  #   daily_program_smokes = [average_smoke]
  #   30.times do |i|
  #     daily_program_smokes << (-average_smoke.fdiv(30) * (i + 1) + average_smoke).round
  #     i += 1
  #   end
  #   return daily_program_smokes
  # end

  # def get_program_day(current_user)
  #   program_date_launch = Program.where(user: current_user).first.start_time
  #   #current_user.program.start_time
  #   date_of_connexion = Program::DEMO_DAY
  #   program_day = (date_of_connexion - program_date_launch).to_i
  #   return program_day
  # end

end
