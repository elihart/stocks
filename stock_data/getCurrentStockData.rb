# This file retrieves the current stock information for a given 
# set of stocks.
# Eli Hart
# 7/1/13

require 'open-uri'
require 'csv'

# This is the base uri for getting a quote
BASE = "http://download.finance.yahoo.com/d/quotes.csv"
# List of property codes - http://code.google.com/p/yahoo-finance-managed/wiki/enumQuoteProperty
PROPERTIES = %w[s0 o0 a0 b0 v0] 
# Yahoo only permits you to retrieve 200 stocks at once
BATCH_SIZE = 200

# open list of stocks and create array with ticker symbols
stockList = Array.new
File.open('stock_list.txt') do |file|
  while line = file.gets
    stockList.push(line.split()[0])
  end
end

# We are limited in how many stocks we can get at once. Do them in batches
count = 0
stockList.each_slice(BATCH_SIZE) do |batch|

	# Append list of stocks to get to the 's' parameter, with ticker symbols 
	# separated by commas
	query = BASE + '?s='

	# add each stock to the request, separate with commas
	batch.each do |stock|
		query += stock + ','
	end

	# Remove last comma
	query = query[0..-2]

	# Add property paramters to customize quote details	
	query += '&f='
	PROPERTIES.each {|p| query += p}

	# End file with static csv parameter
	query += '&e=.csv'

	# Retrieve and store results
	File.open("data/temp#{count}.csv", "wb") do |saved_file|
		# the following "open" is provided by open-uri
		open(query, 'rb') do |read_file|
		  saved_file.write(read_file.read)
		end
	end
	
	count += 1
end

#combine results into one file
CSV.open("data/#{DateTime.now.to_s.gsub(':', '#')}.csv", "wb") do |result|
  # Open each result file and copy results
	count.times do |i|
		path = "data/temp#{i}.csv"
		CSV.foreach(path) do |row|
			result << row
		end
		File.delete(path)
	end
end






































