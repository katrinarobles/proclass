class FakeBookingsController < ApplicationController
  def new
    @fake_booking = FakeBooking.new
  end

  def create
    @fake_booking = FakeBooking.new(fake_booking_params)
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
    @fake_booking.occurence = @occurence
    @fake_booking.save if @course.user == current_user
    redirect_to course_occurence_path(@course, @occurence, anchor: "fakes-#{@fake_booking.id}"), notice: 'Created Fake Booking successfully'
  end

  def destroy
    @fake_booking = FakeBooking.find(params[:id])
    @fake_booking.destroy
    if params[:page] == 'occurences/show'
      respond_to do |format|
        format.js { render template: 'fake_bookings/update_fakebooking' }
      end
    else
      redirect_to course_occurence_path(@fake_booking.occurence.course, @fake_booking.occurence), notice: "Deleted successfully" if @fake_booking.destroy
    end
  end

  private

  def fake_booking_params
    params.require(:fake_booking).permit(:fake_first_name, :fake_last_name, :fake_email)
  end
end
