require "rails_helper" 

RSpec.describe "bachelorette show page", type: :feature do 
  before(:each) do 
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
  end

  it "displays a bachelorette's name, season number, and description of their season" do 
    visit bachelorette_path(@hannah.id)

    expect(page).to have_content("Hannah Brown")
    expect(page).to have_content("Season 15 - The Most Dramatic Season Yet!")
  end

  it "has a link to display a bachelorette's contestants from that season" do 
    visit bachelorette_path(@hannah.id)
    
    expect(page).to have_link("Season #{@hannah.season_number}'s Contestants")
    click_link "Season #{@hannah.season_number}'s Contestants"
    expect(current_path).to eq(bachelorette_contestants_path(@hannah.id))
  end
end