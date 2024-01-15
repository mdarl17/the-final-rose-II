require "rails_helper" 

RSpec.describe "bachelorette contestants index page", type: :feature do
  before(:each) do 
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
    @contestant = Contestant.create!(name: "Pilot Pete", age: 34, hometown: "Irving, TX", bachelorette_id: @hannah.id)
  end

  it "displays the name, age, and hometown of each bachelorette's contestants" do 
    visit bachelorette_contestants_path(@hannah.id)
    
    expect(page).to have_content("Name: Pilot Pete")
    expect(page).to have_content("Age: 34")
    expect(page).to have_content("Hometown: Irving,")
  end

  it "each contestant's name is a link to that contestant's show page" do 
    visit bachelorette_contestants_path(@hannah.id)

    expect(page).to have_link("Pilot Pete")
    click_link("Pilot Pete")

    expect(current_path).to eq(contestant_path(@contestant.id))
  end
end 