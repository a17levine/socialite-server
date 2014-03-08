class TweetsController < ApplicationController
	def index
		#this is gross but will do for now
		@twitter_client ||= Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
			config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
			config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
		end

		@twitter_results = @twitter_client.search("@fullscreen", :lang => "en", count: 10).to_h.to_json
		render json: @twitter_results
	end
end
