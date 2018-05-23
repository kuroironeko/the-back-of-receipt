class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL']
  layout 'mailer'

  def requests_mail(user)
    @products_indices = ProductsIndex.where(group_id: user.group_id)
    mail(to: user.email, subject: t(:updated_requests))
  end
end
