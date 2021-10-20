class NewsMailer < ApplicationMailer
  def admin_email
    @news = params[:news]

    mail(to: @news.user.email, subject: "You got a new order!")
  end
end
