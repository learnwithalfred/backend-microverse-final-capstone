class Ability
  include CanCan::Ability

  def initialize(user)
   
    return unless user.present?

    can :read, Car
    can :manage, User, id: user.id
    can :manage, :all if user.admin?
  end
end
