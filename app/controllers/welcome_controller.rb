class WelcomeController < ApplicationController
	require 'csv'
	MAXNUM = 1000

	def index
	end

	def upload_csv
		uploaded_file = fileupload_param[:file]
		read_csv = uploaded_file.read.split("\r\n").slice(5..-1).join("\r\n")
		@csv_data = CSV.parse(read_csv, headers:true)

		@temperature = @csv_data[" Temperature"].map{|a| a.to_f}.unshift("Temperature").slice(0..MAXNUM)
		@lux = @csv_data[" Lux"].map{|a| a.to_f}.unshift("Lux").slice(0..MAXNUM)
		@humidity = @csv_data[" Humidity"].map{|a| a.to_f}.unshift("Humidity").slice(0..MAXNUM)
		@acc_x = @csv_data[" Acc X"].map{|a| a.to_f}.unshift("Acc X").slice(0..MAXNUM)
		@acc_y = @csv_data[" Acc Y"].map{|a| a.to_f}.unshift("Acc Y").slice(0..MAXNUM)
		@acc_z = @csv_data[" Acc Z"].map{|a| a.to_f}.unshift("Acc Z").slice(0..MAXNUM)
		#binding.pry
		#logger.debug @csv_data
		render
	end

	private
	def fileupload_param
	  params.require(:fileupload).permit(:file)
	end

end
