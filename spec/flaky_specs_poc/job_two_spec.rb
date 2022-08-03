# frozen_string_literal: true

require "sidekiq/testing"

RSpec.describe FlakySpecsPoc::JobOne do

  # This is an example of a common mistake that will lead to flaky tests.
  # By not wrapping our specs in the `inline!` block, all other Sidekiq jobs
  # queued by tests run after this one will be run inline, which might cause
  # unexpected side effects. In our case, an external HTTP request that the
  # vcr gem was not expecting.
  before do
    Sidekiq::Testing.inline!
  end

  it "checks something done by the HttpJob" do
    VCR.use_cassette("job_one") do
      subject.perform
    end
    expect(true).to eq(true)
  end
end
