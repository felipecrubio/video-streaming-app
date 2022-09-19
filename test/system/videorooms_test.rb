require "application_system_test_case"

class VideoroomsTest < ApplicationSystemTestCase
  test "visiting videorooms index" do
    visit root_url

    assert_selector "h1", text: "Salas de Vídeo"
  end

  test "displays as much videorooms as in db" do
    visit root_url

    assert_selector "h2", count: Videoroom.count
  end

  test "lets a visitor create a new videoroom" do
    visit "/videorooms/new"

    fill_in "videoroom_name", with: "Nova sala"

    click_on "Criar sala"

    assert_text "Nova sala"
  end
end
