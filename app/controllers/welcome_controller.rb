class WelcomeController < ApplicationController
	require 'csv'

	def index
	end

	def upload_csv
		uploaded_file = fileupload_param[:file]
		read_csv = uploaded_file.read.split("\r\n").slice(5..-1).join("\r\n")
		@csv_data = CSV.parse(read_csv, headers:true)

		logger.debug @csv_data
		render
		# respond_to do |format|
		# 	format.js {
		# 		render :template => "welcome/index.js.erb"
		# 	}
		# end

		# respond_to do |format|
		# 	format.js 
		# end

		# render 'index', :format => :js
	end

	private
	def fileupload_param
	  params.require(:fileupload).permit(:file)
	end

end
