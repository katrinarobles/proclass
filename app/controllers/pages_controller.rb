class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @courses = Course.all
    @occurences = Occurence.all.order(date: :asc).paginate(:per_page => 8, :page => params[:page])
  end

  def dashboard
    @user = current_user
  end
end
