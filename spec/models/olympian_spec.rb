require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :age }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :team }
  end

  describe "relationships" do
    it { should have_many :olympian_events }
    it { should have_many :events }
  end

  describe "instance_methods" do
    before :each do
      @olympian_1 = create(:olympian)
      @olympian_2 = create(:olympian)
      @olympian_3 = create(:olympian)
      @olympian_4 = create(:olympian)
      @olympian_5 = create(:olympian)

      @event_1 = create(:event)
      @event_2 = create(:event)
      @event_3 = create(:event)

      # olympian_1 medals = 1
      # olympian_2 medals = 2
      # olympian_3 medals = 3
      # olympians 4 and 5 have 0 medals

      @olympian_event_1_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: "Gold" )
      @olympian_event_2_1 = create(:olympian_event, olympian: @olympian_2, event: @event_1, medal: "Silver" )
      @olympian_event_3_1 = create(:olympian_event, olympian: @olympian_3, event: @event_1, medal: "Bronze" )
      @olympian_event_4_1 = create(:olympian_event, olympian: @olympian_4, event: @event_1, medal: "NA" )
      @olympian_event_4_1 = create(:olympian_event, olympian: @olympian_5, event: @event_1, medal: "NA" )

      @olympian_event_1_2 = create(:olympian_event, olympian: @olympian_1, event: @event_2, medal: "NA" )
      @olympian_event_2_2 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: "Silver" )
      @olympian_event_3_2 = create(:olympian_event, olympian: @olympian_3, event: @event_2, medal: "Bronze" )
      @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_4, event: @event_2, medal: "NA" )
      @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_5, event: @event_2, medal: "NA" )

      @olympian_event_1_2 = create(:olympian_event, olympian: @olympian_1, event: @event_3, medal: "NA" )
      @olympian_event_2_2 = create(:olympian_event, olympian: @olympian_2, event: @event_3, medal: "NA" )
      @olympian_event_3_2 = create(:olympian_event, olympian: @olympian_3, event: @event_3, medal: "Bronze" )
      @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_4, event: @event_3, medal: "NA" )
      @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_5, event: @event_3, medal: "NA" )
    end
    it "knows its total_medals_won" do
      expect(@olympian_1.total_medals_won).to eq(1)
      expect(@olympian_2.total_medals_won).to eq(2)
      expect(@olympian_3.total_medals_won).to eq(3)
      expect(@olympian_4.total_medals_won).to eq(0)
      expect(@olympian_5.total_medals_won).to eq(0)
    end
  end
end
