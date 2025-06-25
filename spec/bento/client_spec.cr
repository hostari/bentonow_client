require "../spec_helper"

describe Bento::Client do
  describe ".new" do
    it "accepts a publishable key and secret key" do
      bento_client = Bento::Client.new(publishable_key: "fake-publishable-key", secret_key: "fake-secret-key")
      typeof(bento_client).should eq(Bento::Client)
    end
  end
  describe "#reset_client" do
    it "responds" do
      bento_client = Bento::Client.new(publishable_key: "fake-publishable-key", secret_key: "fake-secret-key")
      bento_client.responds_to?(:reset_client).should be_true
    end
    it "returns an HTTP::Client" do
      bento_client = Bento::Client.new(publishable_key: "fake-publishable-key", secret_key: "fake-secret-key")
      typeof(bento_client.reset_client).should eq(HTTP::Client)
    end
  end
end
