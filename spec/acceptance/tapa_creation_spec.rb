require 'acceptance/acceptance_helper'

feature 'Tapa Creation', %q{
  In order to make tapas availble for folks to see
  As a user
  I want create a tapa
} do

  background do
    Tapa.destroy_all
    Rating.destroy_all
    Category.destroy_all
    Categorization.destroy_all
    Location.destroy_all
  end

  scenario 'create new tapa' do
    sign_in
    visit new_tapa_path
    title = "Egg roll"
    fill_in "Title", with: title
    fill_in "Category", with: "asian"
    select '4', from: "rating"
    fill_in "Description", with: "Soo tasty"
    attach_file("tapa_image", tapa_image)
    fill_in "Location", with: "Juan's Hola House"

    expect {
      click_button "Save"
    }.to change(Tapa, :count).by(1)

    tapa = @user.tapas.first
    expect(tapa.title).to eq(title)
    expect(tapa.rating.score).to eq(4)
  end

end
