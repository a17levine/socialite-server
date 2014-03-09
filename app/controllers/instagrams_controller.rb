class InstagramsController < ApplicationController


	skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
  end



	def index
    first_letter_of_query = instagram_params[0]
    if first_letter_of_query == "#" || first_letter_of_query == "@"
      @instagram_results = "Sorry, you cannot query Instagram with #{first_letter_of_query}"
      render json: @instagram_results
    end
		@instagram_results = RestClient.get "https://api.instagram.com/v1/tags/#{instagram_params}/media/recent?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}"
		render json: @instagram_results
	end

  private

  def instagram_params
    params.require(:instagram_query).to_s
  end

end
