require 'spec_helper'

describe Course do
  describe "Associations" do
    it { should have_many(:enrollments) }
    it { should have_many(:teaching_assignments) }
    it { should have_many(:students) }
    it { should have_many(:teachers) }
    it { should belong_to(:semester) }
  end

  describe "Mass assignment" do
    it { should_not allow_mass_assignment_of(:type) }
  end

  describe "Validations" do
    it { should validate_presence_of(:semester) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:description) }
  end

  describe "Respond to" do
    it { should respond_to(:enrollment) }
    it { should respond_to(:for_semester) }
    it { should respond_to(:average_gradepoint) }
  end

  describe "#enrollment" do
    it "should return the first enrollment" do
      pending
      user = FactoryGirl.create(:user)
      user.full_name.should == user.first_name + ' ' + user.last_name
    end
  end

  describe "#for_semester" do
    it "should return it's semester's id" do
      pending
      admin = FactoryGirl.create(:admin)
      admin.is_admin?.should be_true
    end
  end

  describe "#average_gradepoint" do
    it "should the average grade of all enrolled students" do
      pending
      student1 = FactoryGirl.create(:non_admin)
      user.to_s.should == user.full_name
    end
  end
end
