# frozen_string_literal: true

require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/notes", type: :request do
  # Note. As you add validations to Note, be sure to
  # adjust the attributes here as well.

  let!(:user) { FactoryBot.create(:user) }
  let!(:subject) { FactoryBot.create(:subject, user: user) }
  let!(:course) { FactoryBot.create(:course, subject: subject) }
  let!(:valid_attributes) { { entry: "note entry", course: course } }
  let!(:invalid_attributes) { { entry: nil, course: course } }

  before { login_as(user, scope: :user) }

  describe "GET /edit" do
    it "render a successful response" do
      note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
      get edit_subject_course_note_url(subject, course, note)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Note" do
        expect do
          post subject_course_notes_url(subject, course), params: { note: valid_attributes }
        end.to change(Note, :count).by(1)
      end

      it "redirects to the course page" do
        post subject_course_notes_url(subject, course), params: { note: valid_attributes }
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Note" do
        expect do
          post subject_course_notes_url(subject, course), params: { note: invalid_attributes }
        end.to change(Note, :count).by(0)
      end

      it "renders a successful response (i.e. to display the course page)" do
        post subject_course_notes_url(subject, course), params: { note: invalid_attributes }
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { entry: "new note entry", course: course }
      end

      it "updates the requested note" do
        note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
        patch subject_course_note_url(subject, course, note), params: { note: new_attributes }
        note.reload
        expect(note[:entry]).to eq(new_attributes[:entry])
      end

      it "redirects to the course page" do
        note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
        patch subject_course_note_url(subject, course, note), params: { note: new_attributes }
        note.reload
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
        patch subject_course_note_url(subject, course, note), params: { note: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested note" do
      note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
      expect do
        delete subject_course_note_url(subject, course, note)
      end.to change(Note, :count).by(-1)
    end

    it "redirects to the notes list" do
      note = FactoryBot.create(:note, entry: valid_attributes[:entry], course: valid_attributes[:course])
      delete subject_course_note_url(subject, course, note)
      expect(response).to redirect_to(subject_course_url(subject, course))
    end
  end
end
