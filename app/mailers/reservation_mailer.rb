class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.reservation_approved.subject
  #
  @reservation = Reservation.all
    @user = User.all
  def reservation_approved
    @user = User.all
    @greeting = "Hi"

   mail(
    to: "neilhawan@gmail.com",
    subject: "Reservation Approved"
   )
  end
end
