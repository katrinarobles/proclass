class OccurencesController < ApplicationController
  before_action :set_occurence, only: [ :show, :edit, :update, :destroy]
  before_action :find_course, only: [:show, :new, :edit, :update, :destroy]

  def show
  end

  def new
    @occurence = Occurence.new
  end

  def create
    @occurence = Occurence.new(occurence_params)
    @course = Course.find(params[:course_id])
    @occurence.course = @course
    if @occurence.save
      redirect_to @course, notice: 'Created Event successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @occurence.update(occurence_params)
      redirect_to @course, notice: 'Updated Event successfully'
    else
      render :edit
    end
  end

  def destroy
    @occurence.destroy
    redirect_to @course, notice: 'Deleted event successfully!'
  end

  private

  def occurence_params
    params.require(:occurence).permit(:date, :time, :capacity, :price, :location)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def set_occurence
    @occurence = Occurence.find(params[:id])
  end
end
