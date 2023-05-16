class ApplicationMailer < ActionMailer::Base
  @reservations = Reservation.all
  default from: "from@example.com"
  layout "mailer"
end
