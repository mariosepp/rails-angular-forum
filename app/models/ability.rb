class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, :all
    can :create, User

    if user.role == "admin"
      can :manage, :all
    elsif User.exists?(user)
      can :create, :all
      can :destroy, [Post, Comment], :user_id => user.id
    end

    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
