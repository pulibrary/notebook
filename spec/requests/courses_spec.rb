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

RSpec.describe "/courses", type: :request do
  # Course. As you add validations to Course, be sure to
  # adjust the attributes here as well.

  let!(:user) { User.create(email: "user@test.com", password: "testpass") }
  let(:subject) { Subject.create!(name: "subject name", user: user) }
  let(:valid_attributes) { { name: "course name", subject: subject } }
  let(:invalid_attributes) { { name: nil, subject: subject } }

  before { login_as(user, scope: :user) }

  describe "GET /show" do
    it "renders a successful response" do
      course = Course.create! valid_attributes
      get subject_course_url(subject, course)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      course = Course.create! valid_attributes
      get edit_subject_course_url(subject, course)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Course" do
        expect do
          post subject_courses_url(subject), params: { course: valid_attributes }
        end.to change(Course, :count).by(1)
      end

      it "redirects to the courses list" do
        post subject_courses_url(subject), params: { course: valid_attributes }
        expect(response).to redirect_to(subject_url(subject))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Course" do
        expect do
          post subject_courses_url(subject), params: { course: invalid_attributes, subject: subject }
        end.to change(Course, :count).by(0)
      end

      it "renders a successful response (i.e. to display the subject page)" do
        post subject_courses_url(subject), params: { course: invalid_attributes }
        expect(response).to redirect_to(subject)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "new course name", subject: subject }
      end

      it "updates the requested course" do
        course = Course.create! valid_attributes
        patch subject_course_url(subject, course), params: { course: new_attributes }
        course.reload
        expect(course[:name]).to eq(new_attributes[:name])
      end

      it "redirects to the courses list" do
        course = Course.create! valid_attributes
        patch subject_course_url(subject, course), params: { course: new_attributes }
        course.reload
        expect(response).to redirect_to(subject_url(subject))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        course = Course.create! valid_attributes
        patch subject_course_url(subject, course), params: { course: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect do
        delete subject_course_url(subject, course)
      end.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete subject_course_url(subject, course)
      expect(response).to redirect_to(subject_url(subject))
    end
  end
end
