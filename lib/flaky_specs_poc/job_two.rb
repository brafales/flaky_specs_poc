# frozen_string_literal: true

require "sidekiq"

module FlakySpecsPoc
  class JobTwo
    include Sidekiq::Job

    def perform
      HttpJob.perform_async
    end
  end
end
