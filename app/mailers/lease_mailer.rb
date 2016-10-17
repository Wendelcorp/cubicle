class LeaseMailer < ApplicationMailer
  def lease_email(space)
    @user = User.find(space.user_id)
    @space = space
    @url = 'https://whispering-spire-50980.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'You Have a New Lease on Cubicle')
  end
end
