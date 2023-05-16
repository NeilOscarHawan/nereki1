require "test_helper"

class ReservationMailerTest < ActionMailer::TestCase
  test "reservation_approved" do
    mail = ReservationMailer.reservation_approved
    assert_equal "Reservation approved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
