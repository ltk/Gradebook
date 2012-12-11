require 'spec_helper'

describe User do
  describe "Associations" do
    it { should have_many(:enrollments) }
    it { should have_many(:enrolled_courses) }
    it { should have_many(:teaching_assignments) }
    it { should have_many(:taught_courses) }
  end

  describe "Mass assignment" do
    it { should_not allow_mass_assignment_of(:type) }
  end

  describe "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:password) }

    it { should allow_value('an-email-address@gmail.com').for(:email) }
    it { should_not allow_value('not-an@email.').for(:email) }
  end

  describe "Respond to" do
    it { should respond_to(:is_admin?) }
    it { should respond_to(:full_name) }
  end

  describe "#full_name" do
    it "should return the concatenation of first and last name" do
      user = FactoryGirl.create(:user)
      user.full_name.should == user.first_name + ' ' + user.last_name
    end
  end

  describe "#is_admin?" do
    it "should return true for an admin" do
      admin = FactoryGirl.create(:admin)
      admin.is_admin?.should be_true
    end

    it "should return false for a teacher" do
      teacher = FactoryGirl.create(:teacher)
      teacher.is_admin?.should_not be_true
    end

    it "should return false for a student" do
      student = FactoryGirl.create(:non_admin)
      student.is_admin?.should_not be_true
    end
  end

  describe "#to_s" do
    it "should return #full_name" do
      user = FactoryGirl.create(:user)
      user.to_s.should == user.full_name
    end
  end
end
