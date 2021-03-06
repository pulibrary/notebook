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

  let(:user) { FactoryBot.create(:user) }
  let(:subject) { FactoryBot.create(:subject) }
  let(:course) { FactoryBot.create(:course) }
  let(:valid_attributes) { { entry: "Biology note" } }
  let(:invalid_attributes) { { entry: nil } }

  describe "GET /edit" do
    context "when not logged in" do
      it "redirects to users/sign_in page" do
        note = FactoryBot.create(:note)
        get edit_subject_course_note_url(subject, course, note)
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "when logged in" do
      it "render a successful response" do
        sign_in user
        note = FactoryBot.create(:note)
        get edit_subject_course_note_url(subject, course, note)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "when not logged in" do
      it "redirects to users/sign_in page" do
        post subject_course_notes_url(subject, course), params: { note: valid_attributes }
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "when logged in with valid parameters" do
      it "creates a new Note" do
        sign_in user
        expect do
          post subject_course_notes_url(subject, course), params: { note: valid_attributes }
        end.to change(Note, :count).by(1)
      end

      it "redirects to the course page" do
        sign_in user
        post subject_course_notes_url(subject, course), params: { note: valid_attributes }
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "when logged in with invalid parameters" do
      it "does not create a new Note" do
        sign_in user
        expect do
          post subject_course_notes_url(subject, course), params: { note: invalid_attributes }
        end.to change(Note, :count).by(0)
      end

      it "renders a successful response (i.e. to display the course page)" do
        sign_in user
        post subject_course_notes_url(subject, course), params: { note: invalid_attributes }
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end
  end

  describe "PATCH /update" do
    let(:new_attributes) do
      { entry: "note entry", course: course }
    end

    context "when not logged in" do
      it "redirects to users/sign_in page" do
        note = FactoryBot.create(:note)
        patch subject_course_note_url(subject, course, note), params: { note: new_attributes }
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "when logged in with valid parameters" do
      it "updates the requested note" do
        sign_in user
        note = FactoryBot.create(:note)
        patch subject_course_note_url(subject, course, note), params: { note: new_attributes }
        note.reload
        expect(note[:entry]).to eq(new_attributes[:entry])
      end

      it "redirects to the course page" do
        sign_in user
        note = FactoryBot.create(:note)
        patch subject_course_note_url(subject, course, note), params: { note: new_attributes }
        note.reload
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "when logged in with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sign_in user
        note = FactoryBot.create(:note)
        patch subject_course_note_url(subject, course, note), params: { note: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    context "when not logged in" do
      it "redirects to users/sign_in page" do
        note = FactoryBot.create(:note)
        delete subject_course_note_url(subject, course, note)
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "when logged in" do
      it "destroys the requested note" do
        sign_in user
        note = FactoryBot.create(:note)
        expect do
          delete subject_course_note_url(subject, course, note)
        end.to change(Note, :count).by(-1)
      end

      it "redirects to the notes list" do
        sign_in user
        note = FactoryBot.create(:note)
        delete subject_course_note_url(subject, course, note)
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end
  end
end
