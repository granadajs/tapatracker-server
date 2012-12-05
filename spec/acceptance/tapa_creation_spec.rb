require 'acceptance/acceptance_helper'

feature 'Tapa Creation', %q{
  In order to make tapas availble for folks to see
  As a user
  I want create a tapa
} do

  scenario 'create new tapa' do
    visit new_tapa_path
    fill_in "Title", with: "Egg roll"
    fill_in "Category", with: "asian"
    click_button "rate_4"
    fill_in "Description", with: "Soo tasty"
    attach_file("image", tapa_image)
    fill_in "location", with: "Juan's Hola House"

    expect {
      click_button "Submit"
    }.to change(Tapa, :count).by(1)

    tapa = Tapa.first
    expect(tapa.title).to eq("Egg roll")
    expect(tapa.rating.value).to eq(4)
  end

end
