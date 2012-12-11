require 'spec_helper'

describe TeachingAssignment do
  describe "Associations" do
    it { should belong_to(:course) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:course) }
    it { should validate_uniqueness_of(:teacher_id) }
  end
end
