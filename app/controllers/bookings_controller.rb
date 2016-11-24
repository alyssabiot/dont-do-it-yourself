class BookingsController < ApplicationController
  before_action :set_skill, only: [ :create]

  def create
    @booking = Booking.new(booking_params)
    @booking.skill = @skill
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      @user = @skill.user
      render 'skills/show', skill: @skill, user: @user
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.accepted = params[:booking][:accepted]
    @booking.save
    redirect_to user_path(current_user)
  end

  private
  def booking_params
    params.require(:booking).permit(:starts_at, :duration, :user_id, :skill_id)
  end

  def set_skill
    @skill = Skill.find(params[:skill_id])
  end
end
