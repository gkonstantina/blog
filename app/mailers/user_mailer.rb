class UserMailer < ActionMailer::Base
  default from: "info@three99.com", to: ["vas@gmail.com","dim", ""]

  def welcome_email(user)
    @user = user
    @url  = url_for(controller: 'articles', action: 'index', only_path: false)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site', from: "support@three99.com")
  end

  def art_confirm_email(user)
    @user = user
    @url  = url_for(controller: 'articles', action: 'index', only_path: false)
    mail(to: @user.email, subject: 'Article Published', from: "support@three99.com")
  end

end
