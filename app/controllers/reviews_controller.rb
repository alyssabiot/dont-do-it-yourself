class ReviewsController < ApplicationController

  def create
    @booking = Booking.find(params[:id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to user_path(current_user)
    else
      render 'users/show'
    end

    # penser à mettre à jour l'average_rating de la skill quand la review est sauvée
  end

  def review_params
    params.require(:booking).permit(:content, :rating, :user_id, :booking_id)
  end
end
