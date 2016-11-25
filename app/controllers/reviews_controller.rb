class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @skill = @booking.skill
    @user = @skill.user
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    @skill = @booking.skill
    if @review.save
      redirect_to skill_path(@skill)
    else
      render :new
    end

    # penser à mettre à jour l'average_rating de la skill quand la review est sauvée
  end


  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
