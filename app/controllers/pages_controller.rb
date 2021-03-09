class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :home]

  def home
    # @courses = Course.all
    @occurences = Occurence.where.not(longitude: nil, latitude: nil).order(date: :asc).limit(30)

    @markers = @occurences.geocoded.map do |occurence|
      {
        lat: occurence.latitude,
        lng: occurence.longitude,
        id: occurence.id,
        infoWindow: render_to_string(partial: "info_window", locals: { occurence: occurence })
      }
    end
  end

  def dashboard
    @course = Course.new
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
    @sorted_bookings = @bookings.sort_by {|booking| booking.occurence.date }
  end

  def landing
  end
end
