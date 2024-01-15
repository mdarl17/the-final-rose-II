require "rails_helper" 

RSpec.describe "contestants show page", type: :feature do 
  before(:each) do 
    @molly = Bachelorette.create!(name: "Molly Brown", season_number: 20, season_description: "No wait, THIS is the most dramatic season yet!")
    @ben = Contestant.create!(name: "Ben Higgins", age: 37, hometown: "Denver, CO", bachelorette_id: @molly.id)

    @kickball = Outing.create!(name: "Kickball", location: "Los Angeles, CA", date: "09/12/19")
    @hot_springs = Outing.create!(name: "Hot Springs", location: "Steamboat, CO", date: "01/11/20")
    @helicopter = Outing.create!(name: "Helicopter Ride", location: "Peru", date: "11/22/19")

    @ben_kick = ContestantOuting.create!(contestant_id: @ben.id, outing_id: @kickball.id)
    @ben_springs = ContestantOuting.create!(contestant_id: @ben.id, outing_id: @hot_springs.id)
    @ben_chopper = ContestantOuting.create!(contestant_id: @ben.id, outing_id: @helicopter.id)
  end

  it "displays the contestant's name, season number, season description, and outing names the contestant participated in" do 
    visit contestant_path(@ben.id)

    expect(page).to have_content("Ben Higgins")
    expect(page).to have_content("Season 20 - No wait, THIS is the most dramatic season yet!")
    expect(page).to have_content("Outings:")

    expect(page).to have_link("Kickball")
    click_link("Kickball")
    expect(current_path).to eq(outing_path(@ben_kick.outing_id))

    visit contestant_path(@ben.id)

    expect(page).to have_link("Hot Springs")
    click_link("Hot Springs")
    expect(current_path).to eq(outing_path(@ben_springs.outing_id))

    visit contestant_path(@ben.id)

    expect(page).to have_link("Helicopter Ride")
    click_link("Helicopter Ride")
    expect(current_path).to eq(outing_path(@ben_chopper.outing_id))
  end
end 