class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
