class SignUpWorker
  include Sidekiq::Worker

  def perform(userid)
    user = User.find(userid)
    WelcomeMailer.new_welcome_email(user).deliver_later
  end
end
