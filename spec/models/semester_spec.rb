require 'spec_helper'

describe Semester do
  describe "Associations" do
    it { should have_many(:courses) }
  end

  describe "Mass assignment" do
    it { should_not allow_mass_assignment_of(:type) }
  end

  describe "Validations" do
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:name) }
  end
end
