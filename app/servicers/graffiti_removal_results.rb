class GraffitiRemovalResults
	
	def initialize(params)
		@client = params[:client]
		@graffiti_request = params[:graffiti_request]
		@last_name_results = params[:last_name_results]
		parse_last_name_results
	end

	def results(ward_number)
		# @results = @client.get("https://data.cityofchicago.org/resource/cdmx-wzbz.json?$select=creation_date like '#{@graffiti_request.month}%25'&ward=#{ward_number}")
		@results = @client.get("cdmx-wzbz", :ward => ward_number)
		# @results = client.get("https://data.cityofchicago.org/resource/7ia9-ayc2.json?$where=alderman like '%25#{@graffiti_request.last_name}%25'")

	end


	def parse_last_name_results
		@results_per_alderman = []
		@last_name_results.each do |each_result|
			ward_number = each_result["ward"]
			graffiti_requests_per_ward = results(ward_number)
			graffiti_requests_per_ward = graffiti_requests_per_ward.to_json
			graffiti_requests_per_ward = JSON.parse graffiti_requests_per_ward
			@graffiti_requests_per_ward_per_month = []
			graffiti_requests_per_ward.each do |each_request_per_ward|
				if each_request_per_ward["creation_date"].start_with?(@graffiti_request.month)
					@graffiti_requests_per_ward_per_month << each_request_per_ward
				end
			end

			@results_per_alderman << {"alderman_full_name" => each_result["alderman"], "ward_number" => each_result["ward"], "month_and_year" => @graffiti_request.month, "total_number_of_requests" => @graffiti_requests_per_ward_per_month.length}
		end
		@results_per_alderman
	end


end

