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
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
