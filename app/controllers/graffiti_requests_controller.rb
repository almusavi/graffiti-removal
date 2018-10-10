class GraffitiRequestsController < ApplicationController
	def create
		@graffiti_request = GraffitiRequest.new
		@graffiti_request = @graffiti_request.update_attributes(graffiti_requests_params)
		render "show"

	end

	def show
	end


	private

	def graffiti_requests_params
		params.require(:graffiti_request).permit(:last_name, :month)
	end
end
