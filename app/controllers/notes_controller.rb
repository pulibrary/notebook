class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]
  before_action :set_course
  before_action :set_subject

  def show
  end

  def edit
  end

  def create
    @note = @course.notes.create(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to subject_course_path(@subject, @course), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: subject_course_path(@subject, @course) }
      else
        format.html { redirect_to "subject_course_path(@subject, @course)" }
        format.json { render json: subject_course_path(@subject, @course).errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to subject_course_path(@subject, @course), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: subject_course_path(@subject, @course) }
      else
        format.html { render :edit }
        format.json { render json: subject_course_path(@subject, @course).errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to subject_course_path(@subject, @course), notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:entry)
    end
end
