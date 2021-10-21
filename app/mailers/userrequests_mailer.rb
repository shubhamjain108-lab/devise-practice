class UserrequestsMailer < ApplicationMailer
  def admin_mail
    @userrequest = params[:userrequest]
    get_admin_name(@userrequest.admin)
    mail(to: get_admin_email(@userrequest.admin), subject: "You got a news request!")
  end

  def get_admin_email(user)
    User.find(user).email
  end

  def get_admin_name(user)
    @admin_name = User.find(user).username
  end

  def approve_notification
    @userrequest = params[:userrequest]
    p @userrequest
    mail(to: @userrequest.user.email, subject: "Your news request has approved!")
  end

  def user_email
    @userrequest = params[:userrequest]

    mail(to: @userrequest.user.email, subject: "You have created news successfully!")
  end

  def all_user_email
  end
end
