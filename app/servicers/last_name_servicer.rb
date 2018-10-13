class LastNameServicer
	
	def initialize(params)
		@results = params[:results]
		@graffiti_request = params[:graffiti_request]
		get_last_names_results
	end

	def get_last_names_results
		@results = @results.to_json
		@results = JSON.parse @results
		@last_name_results = []
		@results.each do |each_result|
			if each_result["alderman"].split(" ")[-1] == @graffiti_request.last_name
				@last_name_results << each_result
			end
		end
		@results = @last_name_results
	end
end

