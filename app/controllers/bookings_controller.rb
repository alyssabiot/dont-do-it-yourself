class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.skill = @skill
    if @booking.save
      redirect_to user_path(current_user)
    else
      render 'skills/show'
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:starts_at, :duration, :user_id, :skill_id)
  end

  def find_skill
    @skill = Skill.find(params[:skill_id])
  end
end
