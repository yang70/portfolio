class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user || NullUser.new
    @comment = comment
  end

  def view?
    comment.approved || user.editor? || user.id == comment.user_id
  end

  def destroy?
    user.editor?
  end

  def create?
    user.editor? || user.author?
  end

  def update?
    user.editor? || user.id == comment.user_id
  end

  def comment?
    user.editor? || user.author?
  end

  def approve?
    user.editor?
  end
end
