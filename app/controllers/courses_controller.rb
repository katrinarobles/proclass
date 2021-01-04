class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_course, only: [ :show, :edit, :update, :destroy ]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course
    if @course.save
      redirect_to @course, notice: 'Created Course successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to dashboard_path, notice: 'Deleted course successfully!'
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :duration)
  end

  def find_course
    @course = Course.find(params[:id])
    authorize @course
  end

end
