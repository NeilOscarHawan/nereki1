class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.reservation_approved.subject
  #
  @reservation = Reservation.all
  def reservation_approved
    @greeting = "Hi"

   mail(
    to: "20150008329@my.xu.edu.ph",
    subject: "Reservation Approved"
   )
  end
end
