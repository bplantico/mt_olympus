require 'rails_helper'

describe "Olympians endpoints" do
  before :each do
    @olympian_1 = create(:olympian, age: 1)
    @olympian_2 = create(:olympian, age: 2)
    @olympian_3 = create(:olympian, age: 3)
    @olympian_4 = create(:olympian, age: 4)
    @olympian_5 = create(:olympian, age: 5)

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

  it "sends a list of olympians" do
    get "/api/v1/olympians"

  expect(response).to have_http_status(200)
  data = JSON.parse(response.body, symbolize_names: true)

  expect(data.keys).to eq([:olympians])
  expect(data[:olympians].count).to eq(5)
  expect(data[:olympians][0].keys).to eq([:name, :team, :age, :sport, :total_medals_won])
  end

  it "returns the youngest olympian" do
    get "/api/v1/olympians?age=youngest"

  expect(response).to have_http_status(200)
  data = JSON.parse(response.body, symbolize_names: true)

  expect(data.keys).to eq([:olympian])
  expect(data.count).to eq(1)
  expect(data[:olympian].keys).to eq([:name, :team, :age, :sport, :total_medals_won])
  expect(data[:olympian][:name]).to eq(@olympian_1.name)
  end

  it "returns the youngest olympian" do
    get "/api/v1/olympians?age=oldest"

    expect(response).to have_http_status(200)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.keys).to eq([:olympian])
    expect(data.count).to eq(1)
    expect(data[:olympian].keys).to eq([:name, :team, :age, :sport, :total_medals_won])
    expect(data[:olympian][:name]).to eq(@olympian_5.name)
  end
end
