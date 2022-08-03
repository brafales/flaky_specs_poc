# frozen_string_literal: true

require "uri"
require "net/http"
require "sidekiq"

module FlakySpecsPoc
  class HttpJob
    include Sidekiq::Job

    def perform
      uri = URI("https://reqbin.com/echo/get/json")
      res = Net::HTTP.get_response(uri)
      res.body if res.is_a?(Net::HTTPSuccess)
    end
  end
end
