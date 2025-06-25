require "../spec_helper"

describe Bento::Event do
  describe ".create_event" do
    it "responds" do
      Bento::Event.responds_to?(:create_event).should be_true
    end
  end
end
