# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :set_subject

  def show; end

  def edit; end

  def create
    @course = @subject.courses.create(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @subject, notice: "Course was successfully created." }
      else
        format.html { redirect_to @subject, notice: "Unable to create course." }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @subject, notice: "Course was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to @subject, notice: "Course was successfully destroyed." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name)
    end
end
