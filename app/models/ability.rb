class Ability
  include CanCan::Ability

  def initialize(user)
    case user.class.name
    when 'Mentor'
      can :manage, :all
    when 'User'
      case user.role =='admin'
      when true
        can :manage, :all
      when false
        can :read, :all
      end
    end
  end
end
