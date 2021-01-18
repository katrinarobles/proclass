class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @courses = Course.all
    @occurences = Occurence.all.order(date: :asc)

    if @occurences.exists?
        @markers = @occurences.geocoded.map do |occurence|
          {
            lat: occurence.latitude,
            lng: occurence.longitude
          }
        end
    end
    console

  end

  def dashboard
    @user = current_user
  end
end
