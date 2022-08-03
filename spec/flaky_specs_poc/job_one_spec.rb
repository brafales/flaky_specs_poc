# frozen_string_literal: true

require "sidekiq/testing"

RSpec.describe FlakySpecsPoc::JobOne do
  it "queues an HttpJob" do
    expect do
      subject.perform
    end.to change(FlakySpecsPoc::HttpJob.jobs, :size).by(1)
  end
end
