# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can [:manage], User
        can [:manage], Author
        can [:manage], Category
        can [:manage], Tale
        can [:manage], Request
        can [:manage], Reviewtale
      end

      if user.admin == false
        can [:manage], User, id: user.id
        can [:read], Author
        can [:read], Category
        can [:update, :destroy], Tale, id: user.id
        can [:read, :create, :preview], Tale
        can [:manage], Reviewtale, user_id: user.id
        can [:manage], Request, user_id: user.id
      end
    else
      can [:show], Author
      can [:show],   Category
      can [:preview], Tale
    end
  end
end
