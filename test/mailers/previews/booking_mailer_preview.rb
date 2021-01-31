# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booked
  def booked

    booking = Booking.first
    BookingMailer.with(booking: booking).booked
  end

end
