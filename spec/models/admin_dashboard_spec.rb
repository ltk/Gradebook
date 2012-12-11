require 'spec_helper'

describe AdminDashboard do
  describe "#initialize" do
    it "should set an instance variable for all semester data when initialized with a semster " do
      semester = FactoryGirl.create(:semester)
      course = FactoryGirl.create(:course, :semester => semester)
      admin_dashboard = AdminDashboard.new(semester)
      admin_dashboard.data.should eq(:courses => { semester => Course.for_semester(semester).order('name ASC') })
    end
  end
end
