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
      sum = 0
      count = 0
      @skill.bookings.each do |booking|
        booking.reviews.each do |review|
          sum += review.rating
          count += 1
        end
      end
      @skill.average_rating = sum/count
      @skill.save
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
