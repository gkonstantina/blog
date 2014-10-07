class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :join]
  respond_to :html

  def join
    @course.users << current_user
    redirect_to @course, notice: "You have successfully joined the course!"
  end

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.save
    respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :text)
    end
end
