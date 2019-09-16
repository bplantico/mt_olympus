require 'rails_helper'

describe "Olympians endpoints" do
  before :each do
    olympians = create_list(:olympian, 50)
  end

  it "sends a list of olympians" do
    get "/api/v1/olympians"

  expect(response).to have_http_status(200)

  data = JSON.parse(response.body, symbolize_names: true)[:data]
  expect(data).to eq("")
  end
end
