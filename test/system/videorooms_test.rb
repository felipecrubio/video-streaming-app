require "application_system_test_case"

class VideoroomsTest < ApplicationSystemTestCase
  test "visiting videorooms index" do
    visit root_url

    assert_selector "h4", text: "Salas"
  end

  test "displays as much videorooms as in db" do
    visit root_url

    assert_selector ".video-list-item", count: Videoroom.count
  end

  test "lets a visitor create a new videoroom" do
    visit "/videorooms/new"

    fill_in "videoroom_name", with: "Minha primeira sala"

    # Cloudinary
    page.attach_file("Video", "public/test/uploads/tmp/teste.mp4")

    click_on "Criar sala"

    assert_text "Minha primeira sala"
  end
end
