class NewGigMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_mail(user)
    @user = user
    mail( :to => user.email, :subject => 'New GIG' )
  end
end