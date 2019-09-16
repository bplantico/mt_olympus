require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of :event }
    it { should validate_uniqueness_of :event }
    it { should validate_presence_of :sport }
    it { should validate_presence_of :games }
  end
end