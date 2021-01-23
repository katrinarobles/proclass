class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @courses = Course.all
    @occurences = Occurence.where.not(longitude: nil, latitude: nil).order(date: :asc).limit(12)

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
    @user = current_user
    @q = Booking.where(user_id: @user.id).ransack(params[:q])
    @bookings = @q.result.includes(:occurence).page(params[:page])
    console
  end
end
