class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booked.subject
  #
  def booked
    @booking = params[:booking]

    mail(
      to: @booking.user.email,
      subject: "Booked to #{@booking.occurence.dateparse.strftime("%^a, %e %^b %H:%M")} with #{@booking.occurence.course.teacher}!"
    )
  end
end
