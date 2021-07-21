require "rails_helper"

RSpec.describe HomeworksController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/subjects/1/courses/1/homeworks/1").to route_to("homeworks#show", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subjects/1/courses/1/homeworks/1/edit").to route_to("homeworks#edit", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #create" do
      expect(post: "/subjects/1/courses/1/homeworks").to route_to("homeworks#create", course_id: "1", subject_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/subjects/1/courses/1/homeworks/1").to route_to("homeworks#update", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subjects/1/courses/1/homeworks/1").to route_to("homeworks#update", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subjects/1/courses/1/homeworks/1").to route_to("homeworks#destroy", id: "1", course_id: "1", subject_id: "1")
    end
  end
end
