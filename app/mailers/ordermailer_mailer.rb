class OrdermailerMailer < ApplicationMailer
  default from: 'pyatasandeepsandy@gmail.com'

   def welcome_email()
      @user = current_user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end
end
