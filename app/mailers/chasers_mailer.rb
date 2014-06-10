class ChasersMailer < ActionMailer::Base
  default from: "iwillhuntyoudown@angrykitty.co.uk"

  def harass(user)
    @user = user
    mail(to: user.email, subject: 'Pay the kitty')
  end

end
