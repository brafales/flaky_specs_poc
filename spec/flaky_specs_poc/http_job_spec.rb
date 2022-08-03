# frozen_string_literal: true

RSpec.describe FlakySpecsPoc::HttpJob do
  it "gets a response from a server" do
    VCR.use_cassette("http_job") do
      expect(subject.perform).to eq("{\"success\":\"true\"}\n")
    end
  end
end
