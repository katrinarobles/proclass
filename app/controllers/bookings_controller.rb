class BookingsController < ApplicationController
  before_action :find_occurence, only: [ :destroy]

  def create
    @booking = Booking.new
    @booking.user = current_user
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
    @booking.occurence = @occurence
    if @booking.save
      redirect_back(fallback_location: course_occurence_path(@course, @occurence), notice: 'Booked successfully!')
    else
      render :new
    end
      # respond_to do |format|
      #   if @booking.save
      #     format.js { render template: 'bookings/update_booking_card' }
      #   else
      #     render :new
      #   end
      # end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_back(fallback_location: dashboard_path, notice: 'Unregistered successfully!')
  end


  private
  def find_occurence
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
  end
end
