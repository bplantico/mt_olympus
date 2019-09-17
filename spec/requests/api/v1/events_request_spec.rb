require 'rails_helper'

describe "Events request endpoint" do
  before :each do
    @event_1 = create(:event, sport: "Archery")
    @event_2 = create(:event, sport: "Badminton" )
    @event_3 = create(:event, sport: "Badminton" )
    @event_4 = create(:event, sport: "Archery" )
    @event_5 = create(:event, sport: "Soccer" )
    @event_6 = create(:event, sport: "Track" )
  end

  it "returns aggregate olypmpian statistics" do
    get "/api/v1/events"

    expect(response).to have_http_status(200)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.keys).to eq([:events])
    expect(data[:events].count).to eq(4)
    expect(data[:events].first.keys).to eq([:sport, :events])
  end

end
