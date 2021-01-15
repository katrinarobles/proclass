class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_course, only: [ :show, :edit, :update, :destroy ]

  def index
    # @courses = Course.all
    @q = Occurence.ransack(params[:q])
    # @courses = @q.result.includes(:user).page(params[:page])\
    @occurences = @q.result.includes(:course).page(params[:page]).paginate(:per_page => 8, :page => params[:page])
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
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
    params.require(:course).permit(:name, :description, :duration, :photo)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
