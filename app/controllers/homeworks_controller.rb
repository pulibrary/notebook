# frozen_string_literal: true

class HomeworksController < ApplicationController
  before_action :set_homework, only: %i[show edit update destroy]
  before_action :set_course
  before_action :set_subject

  def edit; end

  def create
    @homework = @course.homeworks.create(homework_params)
    respond_to do |format|
      if @homework.save
        format.html { redirect_to subject_course_path(@subject, @course), notice: "Homework was successfully created." }
      else
        format.html { redirect_to subject_course_path(@subject, @course), notice: "Unable to create homework." }
      end
    end
  end

  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to subject_course_path(@subject, @course), notice: "Homework was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to subject_course_path(@subject, @course), notice: "Homework was successfully destroyed." }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      params.require(:homework).permit(:entry, :due_at)
    end
end
