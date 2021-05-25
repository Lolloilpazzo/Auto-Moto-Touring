require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "creating a Tour" do
    visit tours_url
    click_on "New Tour"

    fill_in "Autista", with: @tour.Autista
    fill_in "Data", with: @tour.Data
    fill_in "Mezzo di trasporto", with: @tour.Mezzo_Di_Trasporto
    fill_in "Partenza", with: @tour.Partenza
    fill_in "Posti disponibili", with: @tour.Posti_Disponibili
    fill_in "Destinazione", with: @tour.destinazione
    fill_in "Durata", with: @tour.durata
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "updating a Tour" do
    visit tours_url
    click_on "Edit", match: :first

    fill_in "Autista", with: @tour.Autista
    fill_in "Data", with: @tour.Data
    fill_in "Mezzo di trasporto", with: @tour.Mezzo_Di_Trasporto
    fill_in "Partenza", with: @tour.Partenza
    fill_in "Posti disponibili", with: @tour.Posti_Disponibili
    fill_in "Destinazione", with: @tour.destinazione
    fill_in "Durata", with: @tour.durata
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour" do
    visit tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour was successfully destroyed"
  end
end
