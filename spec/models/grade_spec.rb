require 'spec_helper'

describe Grade do

  describe "Respond to" do    
    subject { Grade.new(4.0) } 

    it { should respond_to(:to_letter) }
    it { should respond_to(:to_gradepoint) }
    it { should respond_to(:to_label) }
    it { should respond_to(:present?) }
  end

  describe "#to_letter" do
    it "should return the proper letter grade when initialized with a number" do
      grade = Grade.new(4.0)
      grade.to_letter.should eq('A')

      grade = Grade.new(1.7)
      grade.to_letter.should eq('C-')

      grade = Grade.new(0)
      grade.to_letter.should eq('F')
    end
    it "should return the proper letter grade when initialized with a letter" do
      grade = Grade.new('A')
      grade.to_letter.should eq('A')

      grade = Grade.new('C-')
      grade.to_letter.should eq('C-')

      grade = Grade.new('F')
      grade.to_letter.should eq('F')
    end
  end

  describe "#to_gradepoint" do
    it "should return the proper gradepoint when initialized with a number" do
      grade = Grade.new(4.0)
      grade.to_gradepoint.should eq(4.0)

      grade = Grade.new(1.7)
      grade.to_gradepoint.should eq(1.7)

      grade = Grade.new(0)
      grade.to_gradepoint.should eq(0.0)
    end
    it "should return the proper gradepoint when initialized with a letter" do
      grade = Grade.new('A')
      grade.to_gradepoint.should eq(4.0)

      grade = Grade.new('C-')
      grade.to_gradepoint.should eq(1.7)

      grade = Grade.new('F')
      grade.to_gradepoint.should eq(0.0)
    end
  end

  describe "#to_label" do
    it "should return the proper bootstrap label" do
      grade = Grade.new('A')
      grade.to_label.should eq('success')

      grade = Grade.new(3.0)
      grade.to_label.should eq('info')

      grade = Grade.new('C-')
      grade.to_label.should eq('warning')

      grade = Grade.new(0.7)
      grade.to_label.should eq('important')

      grade = Grade.new('F')
      grade.to_label.should eq('inverse')
    end
  end
  describe "#present?" do
    it "should return true if properly initialized with a grade" do
      grade = Grade.new('F')
      grade.present?.should be_true

      grade = Grade.new(3.7)
      grade.present?.should be_true 
    end

    it "should return false if not properly initialized with a grade" do
      grade = Grade.new(false)
      grade.present?.should_not be_true
    end
  end
end
