# frozen_string_literal: true

require "rails_helper"

RSpec.describe CoursesController, type: :routing do
  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe "routing" do
    it "routes to #show" do
      expect(get: "/subjects/1/courses/1").to route_to("courses#show", id: "1", subject_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subjects/1/courses/1/edit").to route_to("courses#edit", id: "1", subject_id: "1")
    end

    it "routes to #create" do
      expect(post: "/subjects/1/courses").to route_to("courses#create", subject_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/subjects/1/courses/1").to route_to("courses#update", id: "1", subject_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subjects/1/courses/1").to route_to("courses#update", id: "1", subject_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subjects/1/courses/1").to route_to("courses#destroy", id: "1", subject_id: "1")
    end
  end
end
