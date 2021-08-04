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

RSpec.describe "/subjects", type: :request do
  # Subject. As you add validations to Subject, be sure to
  # adjust the attributes here as well.

  let!(:user) { FactoryBot.create(:user) }
  let!(:valid_attributes) { { name: "subject name", user: user } }
  let!(:invalid_attributes) { { name: nil, user: user } }

  before { login_as(user, scope: :user) }

  describe "GET /index" do
    it "renders a successful response" do
      FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
      get subjects_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
      get subject_url(subject)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
      get edit_subject_url(subject)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Subject" do
        expect do
          post subjects_url, params: { subject: valid_attributes }
        end.to change(Subject, :count).by(1)
      end

      it "redirects to the created subject" do
        post subjects_url, params: { subject: valid_attributes }
        expect(response).to redirect_to(subject_url(Subject.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Subject" do
        expect do
          post subjects_url, params: { subject: invalid_attributes }
        end.to change(Subject, :count).by(0)
      end

      it "renders a successful response (i.e. to display the subjects template)" do
        post subjects_url, params: { subject: invalid_attributes }
        expect(response).to redirect_to(subjects_url)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "new subject name" }
      end

      it "updates the requested subject" do
        subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
        patch subject_url(subject), params: { subject: new_attributes }
        subject.reload
        expect(subject[:name]).to eq(new_attributes[:name])
      end

      it "redirects to the subject" do
        subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
        patch subject_url(subject), params: { subject: new_attributes }
        subject.reload
        expect(response).to redirect_to(subject_url(subject))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
        patch subject_url(subject), params: { subject: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested subject" do
      subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
      expect do
        delete subject_url(subject)
      end.to change(Subject, :count).by(-1)
    end

    it "redirects to the subjects list" do
      subject = FactoryBot.create(:subject, name: valid_attributes[:name], user: valid_attributes[:user])
      delete subject_url(subject)
      expect(response).to redirect_to(subjects_url)
    end
  end
end
