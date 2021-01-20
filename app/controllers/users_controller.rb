class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @user = User.find_by(username: params[:username])
  end
end
