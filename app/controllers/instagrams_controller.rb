class InstagramsController < ApplicationController
	def index
		@instagram_results = RestClient.get "https://api.instagram.com/v1/tags/fullscreen/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}"
		render json: @instagram_results
	end
end
