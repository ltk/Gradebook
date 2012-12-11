require 'spec_helper'

describe Administrator do
  describe "#is_admin" do
    it "should return true" do
      admin = FactoryGirl.create(:admin)
      admin.is_admin?.should be_true
    end
  end

  describe "#to_s" do
    it "should return an admin notice appended to the admin's full name" do
      admin = FactoryGirl.create(:admin, :first_name => "John", :last_name => "Smith")
      admin.to_s.should eq("John Smith (admin)")
    end
  end
end
