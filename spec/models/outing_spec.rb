RSpec.describe Outing, type: :model do 
  describe "relationshiops" do 
    it {should have_many(:contestant_outings)}
    it {should have_many(:contestants).through(:contestant_outings)}
  end
end 