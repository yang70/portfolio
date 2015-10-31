class ProjectPolicy < ApplicationPolicy
  attr_accessor :user, :project

  def initialize(user, project)
    @user = user || NullUser.new
    @project = project
  end

  def destroy?
    user.editor?
  end

  def create?
    user.editor?
  end

  def update?
    user.editor?
  end

  class Scope < Scope
    def resolve
      if user && user.editor?
        scope.all
      end
    end
  end
end
