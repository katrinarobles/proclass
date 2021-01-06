class BookingsController < ApplicationController
  before_action :find_occurence, only: [ :destroy]

  def create
    @booking = Booking.new
    @booking.user = current_user
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
    @booking.occurence = @occurence
    if @booking.save
      redirect_to dashboard_path, notice: 'Created Event successfully'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: 'Deleted course successfully!'
  end

  private
  def find_occurence
    @course = Course.find(params[:course_id])
    @occurence = Occurence.find(params[:occurence_id])
  end
end
