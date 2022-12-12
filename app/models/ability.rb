class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?

    return unless user.present?

    can :read, Car
    can :manage, User, id: user.id
  end
end
