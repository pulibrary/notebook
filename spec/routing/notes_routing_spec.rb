require "rails_helper"

RSpec.describe NotesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/subjects/1/courses/1/notes/1").to route_to("notes#show", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subjects/1/courses/1/notes/1/edit").to route_to("notes#edit", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #create" do
      expect(post: "/subjects/1/courses/1/notes").to route_to("notes#create", course_id: "1", subject_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/subjects/1/courses/1/notes/1").to route_to("notes#update", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subjects/1/courses/1/notes/1").to route_to("notes#update", id: "1", course_id: "1", subject_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subjects/1/courses/1/notes/1").to route_to("notes#destroy", id: "1", course_id: "1", subject_id: "1")
    end
  end
end
