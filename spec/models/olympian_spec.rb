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

  describe  "class methods" do
    before :each do
      @olympian_1 = create(:olympian, age: 1, weight: 1, sex: "F")
      @olympian_2 = create(:olympian, age: 2, weight: 2, sex: "F")
      @olympian_3 = create(:olympian, age: 3, weight: 3, sex: "F")
      @olympian_4 = create(:olympian, age: 4, weight: 4, sex: "M")
      @olympian_5 = create(:olympian, age: 5, weight: 5, sex: "M")
      @olympian_6 = create(:olympian, age: 6, weight: 6, sex: "M")
    end

    it "returns the youngest olympian" do
      expect(Olympian.youngest).to eq(@olympian_1)
    end

    it "returns the oldest olympian" do
      expect(Olympian.oldest).to eq(@olympian_6)
    end

    it "returns the average weight" do
      expect(Olympian.average_weight("males")).to eq(5)
      expect(Olympian.average_weight("females")).to eq(2)
      expect(Olympian.average_weight).to eq(3.5)
    end

    it "returns the average age" do
      expect(Olympian.average_age).to eq(3.5)
    end
  end
end
