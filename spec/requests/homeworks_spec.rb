 require 'rails_helper'

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

RSpec.describe "/homeworks", type: :request do

  # Homework. As you add validations to Homework, be sure to
  # adjust the attributes here as well.
  let(:subject) {
    Subject.create!(name: "subject name")
  }

  let(:course) {
    Course.create!(name: "course name", subject: subject)
  }

  let(:valid_attributes) {
    { entry: "homework entry", due_at: DateTime.now, course: course }
  }

  let(:invalid_attributes) {
    { entry: nil, due_at: nil, course: course }
  }

  describe "GET /show" do
    it "renders a successful response" do
      homework = Homework.create! valid_attributes
      get subject_course_homework_url(subject, course, homework)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      homework = Homework.create! valid_attributes
      get edit_subject_course_homework_url(subject, course, homework)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Homework" do
        expect {
          post subject_course_homeworks_url(subject, course), params: { homework: valid_attributes }
        }.to change(Homework, :count).by(1)
      end

      it "redirects to the course page" do
        post subject_course_homeworks_url(subject, course), params: { homework: valid_attributes }
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Homework" do
        expect {
          post subject_course_homeworks_url(subject, course), params: { homework: invalid_attributes }
        }.to change(Homework, :count).by(0)
      end

      it "renders a successful response (i.e. to display the course page)" do
        post subject_course_homeworks_url(subject, course), params: { homework: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { entry: "new homework entry", due_at: DateTime.new(2022,01,3.5), course: course }
      }

      it "updates the requested homework" do
        homework = Homework.create! valid_attributes
        patch subject_course_homework_url(subject, course, homework), params: { homework: new_attributes }
        homework.reload
        expect(homework[:entry]).to eq(new_attributes[:entry])
        expect(homework[:due_at]).to eq(new_attributes[:due_at])
      end

      it "redirects to the course page" do
        homework = Homework.create! valid_attributes
        patch subject_course_homework_url(subject, course, homework), params: { homework: new_attributes }
        homework.reload
        expect(response).to redirect_to(subject_course_url(subject, course))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        homework = Homework.create! valid_attributes
        patch subject_course_homework_url(subject, course, homework), params: { homework: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested homework" do
      homework = Homework.create! valid_attributes
      expect {
        delete subject_course_homework_url(subject, course, homework)
      }.to change(Homework, :count).by(-1)
    end

    it "redirects to the homeworks list" do
      homework = Homework.create! valid_attributes
      delete subject_course_homework_url(subject, course, homework)
      expect(response).to redirect_to(subject_course_url(subject, course))
    end
  end
end
