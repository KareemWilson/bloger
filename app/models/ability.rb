# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    return unless user.present?
    can :manage, Post, user: user
    can :create, Comment
    can :destroy, Comment, user: user
    return unless user.is? :admin
    can :manage, :all

  end
end
