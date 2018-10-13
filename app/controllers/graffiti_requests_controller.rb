
class GraffitiRequestsController < ApplicationController
	add_breadcrumb "home", :root_path
	def create
		add_breadcrumb "results"
		@graffiti_request = GraffitiRequest.new(graffiti_request_params)
		@graffiti_request.save
		client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["APP_TOKEN"]})
		@graffiti_request.last_name[0] = @graffiti_request.last_name[0].capitalize
		@graffiti_request.save
		@results = client.get("https://data.cityofchicago.org/resource/7ia9-ayc2.json?$where=alderman like '%25#{@graffiti_request.last_name}%25'")
		last_name = LastNameServicer.new(graffiti_request: @graffiti_request, results: @results)
		last_name_results = last_name.get_last_names_results
		@graffiti_removal_results = GraffitiRemovalResults.new(client: client, last_name_results: last_name_results, graffiti_request: @graffiti_request)
		@results = @graffiti_removal_results.parse_last_name_results
	end

	def show
	end

	def index
	end


	private

	def graffiti_request_params
		params.require(:graffiti_request).permit(:last_name, :month)
	end
end
