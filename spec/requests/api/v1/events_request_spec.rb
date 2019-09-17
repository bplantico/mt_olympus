require 'rails_helper'

describe "Events request endpoint" do
  before :each do
    @olympian_1 = create(:olympian, age: 1, weight: 1, sex: "F")
    @olympian_2 = create(:olympian, age: 2, weight: 2, sex: "F")
    @olympian_3 = create(:olympian, age: 3, weight: 3, sex: "F")
    @olympian_4 = create(:olympian, age: 4, weight: 4, sex: "M")
    @olympian_5 = create(:olympian, age: 5, weight: 5, sex: "M")
    @olympian_6 = create(:olympian, age: 6, weight: 6, sex: "M")

    @event_1 = create(:event, sport: "Archery")
    @event_2 = create(:event, sport: "Badminton" )
    @event_3 = create(:event, sport: "Badminton" )
    @event_4 = create(:event, sport: "Archery" )
    @event_5 = create(:event, sport: "Soccer" )
    @event_6 = create(:event, sport: "Track" )

    @olympian_event_1_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: "Gold" )
    @olympian_event_2_1 = create(:olympian_event, olympian: @olympian_2, event: @event_1, medal: "Silver" )
    @olympian_event_3_1 = create(:olympian_event, olympian: @olympian_3, event: @event_1, medal: "Bronze" )
    @olympian_event_4_1 = create(:olympian_event, olympian: @olympian_4, event: @event_1, medal: "NA" )
    @olympian_event_5_1 = create(:olympian_event, olympian: @olympian_5, event: @event_1, medal: "NA" )
    @olympian_event_6_1 = create(:olympian_event, olympian: @olympian_6, event: @event_1, medal: "NA" )
  end

  it "returns aggregate olypmpian statistics" do
    get "/api/v1/events"

    expect(response).to have_http_status(200)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.keys).to eq([:events])
    expect(data[:events].count).to eq(4)
    expect(data[:events].first.keys).to eq([:sport, :events])
  end

  it "returns a list of medalists for a specific event" do
    get "/api/v1/events/#{@event_1.id}/medalists"

    expect(response).to have_http_status(200)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.keys).to eq([:event, :medalists])
    expect(data[:event]).to eq(@event_1.event)
    expect(data[:medalists].count).to eq(3)
  end

end
