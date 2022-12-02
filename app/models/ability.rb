# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # rubocop:disable Metrics/AbcSize , Metrics/MethodLength
  def initialize(user)
    if user.present?
      if user.admin?
        can [:manage], User
        can [:manage], Author
        can [:manage], Category
        can [:manage], Tale
        can [:manage], Request
        can [:manage], Reviewtale
      elsif user.admin == false
        can [:manage], User, id: user.id
        can [:read], User
        can [:read], Author
        can [:read], Category
        can [:update, :destroy], Tale, user_id: user.id
        can [:read, :create, :preview, :show_waiting_censorship, :newest, :many_follow, :many_favourite], Tale
        can [:manage], Reviewtale, user_id: user.id
        can [:manage], Request, user_id: user.id
      end
    else
      can [:show], Author
      can [:show], Category
      can [:preview], Tale
    end
  end
  # rubocop:enable Metrics/AbcSize , Metrics/MethodLength
end
