require "spec_helper"

describe TeachingAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/teaching_assignments").should route_to("teaching_assignments#index")
    end

    it "routes to #new" do
      get("/teaching_assignments/new").should route_to("teaching_assignments#new")
    end

    it "routes to #show" do
      get("/teaching_assignments/1").should route_to("teaching_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teaching_assignments/1/edit").should route_to("teaching_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teaching_assignments").should route_to("teaching_assignments#create")
    end

    it "routes to #update" do
      put("/teaching_assignments/1").should route_to("teaching_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teaching_assignments/1").should route_to("teaching_assignments#destroy", :id => "1")
    end

  end
end
