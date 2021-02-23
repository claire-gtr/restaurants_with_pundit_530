class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Restaurant.all
      # scope.where(user: user)
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # record = @restaurant, argument of the authorize method
  #   # user = current_user
  #   if user == record.user
  #     true
  #   else
  #     false
  #   end
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin == true
  end
end






