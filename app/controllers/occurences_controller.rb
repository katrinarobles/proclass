class OccurencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_occurence, only: [:show, :edit, :update, :destroy]
  before_action :find_course, only: [:show, :new, :create, :edit, :update, :destroy, :destroy_multiple]

  def index
    @course = Course.find(params[:course_id])
    @q = Occurence.where(course_id: @course.id).ransack(params[:q])
    @occurences = @q.result.page(params[:page]).paginate(:per_page => 8, :page => params[:page])
    # @occurences = Occurence.all.order(date: :asc).paginate(:per_page => 8, :page => params[:page])
  end

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
      create_more
      redirect_to @course, notice: 'Created Event successfully'
    else
      render :new
    end
  end

  def create_more
    if @occurence.repeat == 'every day'
        occurence_date = DateTime.parse(params[:occurence][:date])
        end_date = params[:occurence][:end_date] == nil ? Date.today + 3.months : params[:occurence][:end_date]
        loop do
            occurence_date += 1.day
            break if occurence_date > Date.parse(end_date)
            occurence = Occurence.new(occurence_params)
            occurence.date = occurence_date
            occurence.course = @course
            occurence.save
        end
    elsif @occurence.repeat == 'every week'
      occurence_date = DateTime.parse(params[:occurence][:date])
      end_date = params[:occurence][:end_date] == nil ? Date.today + 3.months : params[:occurence][:end_date]
      loop do
        occurence_date += 1.week
        break if occurence_date > Date.parse(end_date)
        occurence = Occurence.new(occurence_params)
        occurence.date = occurence_date
        occurence.course = @course
        occurence.save
      end
    elsif @occurence.repeat == 'every month'
      occurence_date = DateTime.parse(params[:occurence][:date])
      end_date = params[:occurence][:end_date] == nil ? Date.today + 3.months : params[:occurence][:end_date]
      loop do
        occurence_date += 1.month
        break if occurence_date > Date.parse(end_date)
        occurence = Occurence.new(occurence_params)
        occurence.date = occurence_date
        occurence.course = @course
        occurence.save
      end
    end
  end

  def edit
  end

  def update
    if @occurence.update(occurence_params)
      redirect_to @course, notice: 'Updated occurence successfully'
    else
      render :edit
    end
  end

  def destroy
    @occurence.destroy
    redirect_to @course, notice: 'Deleted occurence successfully!'
  end

  def destroy_multiple
    Occurence.destroy(params[:occurence_ids])
    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end

  private

  def occurence_params
    params.require(:occurence).permit(:date, :time, :capacity, :price, :location, :online, :repeat, :end_date)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def set_occurence
    @occurence = Occurence.find(params[:id])
  end
end
