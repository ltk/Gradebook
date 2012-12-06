require 'spec_helper'

describe "TeachingAssignments" do
  describe "GET /teaching_assignments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get teaching_assignments_path
      response.status.should be(200)
    end
  end
end
