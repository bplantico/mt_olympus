require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of :event }
    it { should validate_uniqueness_of :event }
    it { should validate_presence_of :sport }
    it { should validate_presence_of :games }
  end

  describe "relationships" do
    it { should have_many :olympian_events }
    it { should have_many :olympians }
  end

  describe "instance methods" do
    before :each do
      @olympian_1 = create(:olympian, age: 1, weight: 1, sex: "F")
      @olympian_2 = create(:olympian, age: 2, weight: 2, sex: "F")
      @olympian_3 = create(:olympian, age: 3, weight: 3, sex: "F")
      @olympian_4 = create(:olympian, age: 4, weight: 4, sex: "M")
      @olympian_5 = create(:olympian, age: 5, weight: 5, sex: "M")
      @olympian_6 = create(:olympian, age: 6, weight: 6, sex: "M")

      @event_1 = create(:event, event: "Bullseye",        sport: "Archery")

      @olympian_event_1_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: "Gold" )
      @olympian_event_2_1 = create(:olympian_event, olympian: @olympian_2, event: @event_1, medal: "Silver" )
      @olympian_event_3_1 = create(:olympian_event, olympian: @olympian_3, event: @event_1, medal: "Bronze" )
      @olympian_event_4_1 = create(:olympian_event, olympian: @olympian_4, event: @event_1, medal: "NA" )
      @olympian_event_5_1 = create(:olympian_event, olympian: @olympian_5, event: @event_1, medal: "NA" )
      @olympian_event_6_1 = create(:olympian_event, olympian: @olympian_6, event: @event_1, medal: "NA" )
    end

    it "returns its medalists" do
      expect(@event_1.medalists).to eq([@olympian_1, @olympian_2, @olympian_3])
    end
  end
end
