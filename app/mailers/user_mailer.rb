class UserMailer < ActionMailer::Base
  def welcome
    mail(to: 'example@exmample.com')
  end
end
