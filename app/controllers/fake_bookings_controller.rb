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
    redirect_to course_occurence_path(@course, @occurence), notice: 'Created Fake Booking successfully'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def fake_booking_params
    params.require(:fake_booking).permit(:fake_first_name, :fake_last_name, :fake_email)
  end
end
