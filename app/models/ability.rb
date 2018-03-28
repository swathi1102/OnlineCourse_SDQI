class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, Course
      can :create, Course
      can :update, Course do |course|
        course.try(:user) == user
      end
      can :destroy, Course do |course|
        course.try(:user) == user
      end
    else
      can :read, Course
    end
  end
end
