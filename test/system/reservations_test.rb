require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Avr", with: @reservation.avr
    fill_in "Contact num", with: @reservation.contact_num
    fill_in "Res date", with: @reservation.res_date
    fill_in "Res name", with: @reservation.res_name
    fill_in "Res time", with: @reservation.res_time
    fill_in "Res type", with: @reservation.res_type
    fill_in "Sched days", with: @reservation.sched_days
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Avr", with: @reservation.avr
    fill_in "Contact num", with: @reservation.contact_num
    fill_in "Res date", with: @reservation.res_date
    fill_in "Res name", with: @reservation.res_name
    fill_in "Res time", with: @reservation.res_time
    fill_in "Res type", with: @reservation.res_type
    fill_in "Sched days", with: @reservation.sched_days
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
