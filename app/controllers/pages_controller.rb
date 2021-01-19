class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @courses = Course.all
    @occurences = Occurence.where.not(longitude: nil, latitude: nil).order(date: :asc)

    @markers = @occurences.geocoded.map do |occurence|
      {
        lat: occurence.latitude,
        lng: occurence.longitude,
        id: occurence.id,
        infoWindow: render_to_string(partial: "info_window", locals: { occurence: occurence })
      }
    end
    console
  end

  def dashboard
    @user = current_user
  end
end
