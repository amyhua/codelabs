class PhoneMailer < ActionMailer::Base
  @@domain = (("http://codelabs.herokuapp.com" if Rails.env.production?) || "http://localhost:3000")

  default :from => "donotreply.codelabs@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.phone_mailer.instructor_help_email.subject
  #
  def instructor_help_email(student,admin)
    @admin = admin
    @student = student

    # carrier phone numbers:
    # T-Mobile: phonenumber@tmomail.net  max 140 char
    # Verizon: phonenumber@vtext.com  max 160 char
    # Sprint: phonenumber@messaging.sprintpcs.com  max 160 char
    # AT&T: phonenumber@txt.att.net  max 160 char
    # Virgin Mobile: phonenumber@vmobl.com  max 125 char
    # phonenumber = 10-digit cell phone number, no dashes or spaces

    # Email to SMS Messaging is FREE to send. Recipient is charged for receipt
    # of SMS according to their plan.

    # Free Bulk SMS Messaging
    recipients = []

      for admin in @admin
        recipients.push(admin.phone + "@" + domain(admin.carrier)) if admin.receive_sms
        recipients.push(admin.email) if admin.receive_email
      end

    mail(:to => recipients,
         :subject => "#{@student.name} wants coding help!")

  end

  private

  def domain(carrier)
    if carrier == "T-Mobile"
      domain = "tmomail.net"
    elsif carrier == "Verizon"
      domain = "vtext.com"
    elsif carrier == "Sprint"
      domain = "messaging.sprintpcs.com"
    elsif carrier == "ATT"
      domain = "txt.att.net"
    elsif carrier == "Virgin Mobile"
      domain = "vmobl.com"
    else
      raise ArgumentError
    end
  end
end
