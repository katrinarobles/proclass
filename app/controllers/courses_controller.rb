class CoursesController < ApplicationController
  before_action :find_user, only: [:new, :create, :destroy]
  before_action :find_course, only: [ :edit, :update, :destroy ]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = @user
    if @course.save
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course.update(course_params)
    redirect_to dashboard_path
  end

  def destroy
    @course.destroy
    redirect_to dashboard_path(@user)
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration, :price, :capacity)
  end

  def find_user
    @user = current_user
  end

    def find_course
    @course = Course.find(params[:id])
  end
end
