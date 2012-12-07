class Ability
  include CanCan::Ability

  def initialize(user)
    if user
        if user.is_a?(Administrator)
            can :manage, :all
        elsif user.is_a?(Teacher)
            can :read, Course
            can :manage, Course, :teaching_assignments => { :teacher_id => user.id }
            can :read, User
            can :update, User do |u|
                u.id == user.id
            end
        elsif user.is_a?(Student)
            can :read, Course
        end
    end
  end
end
