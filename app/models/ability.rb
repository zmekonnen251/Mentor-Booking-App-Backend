class Ability
  include CanCan::Ability

  def initialize(user)
    case user.class.name
    when 'Mentor'
      case user.role
      when 'mentor'
        can :read, :all
        can :create, Mentor
      when 'admin'
        can :manage, :all
      end
    when 'User'
      case user.role
      when 'user'
        can :read, :all
        can :create, User
      when 'admin'
        can :manage, :all
      end
    end
  end
end
