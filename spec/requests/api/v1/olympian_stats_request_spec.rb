require 'rails_helper'

describe "olympian_stats endpoint" do
  before :each do
    @olympian_1 = create(:olympian, age: 1, weight: 1, sex: "F")
    @olympian_2 = create(:olympian, age: 2, weight: 2, sex: "F")
    @olympian_3 = create(:olympian, age: 3, weight: 3, sex: "F")
    @olympian_4 = create(:olympian, age: 4, weight: 4, sex: "M")
    @olympian_5 = create(:olympian, age: 5, weight: 5, sex: "M")
    @olympian_6 = create(:olympian, age: 6, weight: 6, sex: "M")

    @event_1 = create(:event)
    @event_2 = create(:event)
    @event_3 = create(:event)

    @olympian_event_1_1 = create(:olympian_event, olympian: @olympian_1, event: @event_1, medal: "Gold" )
    @olympian_event_2_1 = create(:olympian_event, olympian: @olympian_2, event: @event_1, medal: "Silver" )
    @olympian_event_3_1 = create(:olympian_event, olympian: @olympian_3, event: @event_1, medal: "Bronze" )
    @olympian_event_4_1 = create(:olympian_event, olympian: @olympian_4, event: @event_1, medal: "NA" )
    @olympian_event_5_1 = create(:olympian_event, olympian: @olympian_5, event: @event_1, medal: "NA" )
    @olympian_event_6_1 = create(:olympian_event, olympian: @olympian_6, event: @event_1, medal: "NA" )

    @olympian_event_1_2 = create(:olympian_event, olympian: @olympian_1, event: @event_2, medal: "NA" )
    @olympian_event_2_2 = create(:olympian_event, olympian: @olympian_2, event: @event_2, medal: "Silver" )
    @olympian_event_3_2 = create(:olympian_event, olympian: @olympian_3, event: @event_2, medal: "Bronze" )
    @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_4, event: @event_2, medal: "NA" )
    @olympian_event_5_2 = create(:olympian_event, olympian: @olympian_5, event: @event_2, medal: "NA" )
    @olympian_event_6_2 = create(:olympian_event, olympian: @olympian_6, event: @event_2, medal: "NA" )

    @olympian_event_1_2 = create(:olympian_event, olympian: @olympian_1, event: @event_3, medal: "NA" )
    @olympian_event_2_2 = create(:olympian_event, olympian: @olympian_2, event: @event_3, medal: "NA" )
    @olympian_event_3_2 = create(:olympian_event, olympian: @olympian_3, event: @event_3, medal: "Bronze" )
    @olympian_event_4_2 = create(:olympian_event, olympian: @olympian_4, event: @event_3, medal: "NA" )
    @olympian_event_5_2 = create(:olympian_event, olympian: @olympian_5, event: @event_3, medal: "NA" )
    @olympian_event_6_2 = create(:olympian_event, olympian: @olympian_6, event: @event_3, medal: "NA" )
  end

  it "returns aggregate olypmpian statistics" do
    get "/api/v1/olympian_stats"

    expect(response).to have_http_status(200)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data.keys).to eq([:olympian_stats])
    expect(data[:olympian_stats].keys).to eq([:total_competing_olympians, :average_weight, :average_age])
  end

end
