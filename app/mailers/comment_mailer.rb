class CommentMailer < ApplicationMailer
  def new_comment_email(article)
    @article = article
    mail(to: @article.author.email, subject: "Your article has a new comment")
  end
end
