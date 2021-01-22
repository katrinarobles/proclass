class BookingsController < ApplicationController
  before_action :find_occurence, only: [ :destroy]

  def create
    @booking = Booking.new
    @booking.user = current_user
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
    @booking.occurence = @occurence
    if @booking.save
      if params[:page] == 'home'
        respond_to do |format|
          format.js { render template: 'bookings/update_booking_card' }
        end
      elsif params[:page] == 'courses/show'
        respond_to do |format|
          format.js { render template: 'occurences/update_booking_course_card' }
        end
      else
        redirect_back(fallback_location: course_occurence_path(@course, @occurence), notice: 'Booked successfully!')
      end
    else
      render :new
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    if params[:page] == 'home'
      respond_to do |format|
          format.js { render template: 'bookings/update_delete_card' }
        end
    elsif params[:page] == 'courses/show'
      respond_to do |format|
          format.js { render template: 'occurences/update_delete_booking' }
        end
    else
    redirect_back(fallback_location: dashboard_path, notice: 'Canceled Booking successfully!')
    end
  end


  private
  def find_occurence
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
  end
end
