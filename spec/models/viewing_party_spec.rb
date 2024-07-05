require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  before(:each) do
    @movie_runtime = 180
    @party = ViewingParty.create!(date: "2023-12-01", start_time: "07:25", duration: 180, movie_runtime: @movie_runtime)
    @user_1 = User.create!(name: 'Sam', email: 'sam@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy@email.com')
    UserParty.create!(user_id: @user_1.id, viewing_party_id: @party.id, host: true)
    UserParty.create!(user_id: @user_2.id, viewing_party_id: @party.id, host: false)
  end
  
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }

    it "validates that duration is not shorter than movie runtime" do
      @party.duration = @movie_runtime + 10
      expect(@party).to be_valid
      @party.duration = @movie_runtime - 10
      expect(@party).not_to be_valid
      expect(@party.errors[:duration]).to include("can't be shorter than the movie runtime")
    end
  end

  describe "instance methods" do
    it "returns user that is hosting the party" do
      expect(@party.find_host).to eq(@user_1)
    end
  end
end