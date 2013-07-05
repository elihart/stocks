require 'open-uri'
require 'csv'

# open list of stocks and create array with ticker symbols
stockList = Array.new
File.open('stock_list_short.txt') do |file|
  while line = file.gets
	# rails needs the names to be lowercase so they aren't constants
    stockList.push(line.split()[0].downcase)
  end
end

# open file to hold migration data
File.open('migration.txt', 'w') do |f|

# for each stock in array...
stockList.each do |stock|

  # download historical data
  filelocation = "data/#{stock}.csv"
  File.open(filelocation, "wb") do |saved_file|
    # the following "open" is provided by open-uri
    open("http://ichart.yahoo.com/table.csv?s=#{stock}&a=5&b=25&c=2003&d=5&e=30&f=2013&g=d&ignore=.csv", 'rb') do |read_file|
      saved_file.write(read_file.read)
    end
  end


    # Enter info to create entry for the stock
    f.puts "# Create #{stock} stock entry"
    f.puts "#{stock} = Stock.new(:ticker => '#{stock}')"
    f.puts "#{stock}.save(:validate => false)"

    f.puts "\n# Create data points for #{stock}"

    # parse csv and add data to migration file
    counter = 0
    CSV.foreach(filelocation) do |row|
      # first row is column names. Just ignore them.
      if counter != 0 then

        # record the data for each column in the row (except for the seventh which we skip)
        pointName = stock + counter.to_s
        f.puts "#{pointName} = DataPoint.new"
        f.puts "#{pointName}.ticker = '#{stock}'"
        f.puts "#{pointName}.stock = #{stock}"
        col = 0
        row.each do |cell|
          # ignore the seventh column. it is adjusted close which doesn't matter
          case col
            when 0
              f.puts "#{pointName}.date = DateTime.new(#{cell.to_s.gsub('-', ',')})"
            when 1
              f.puts "#{pointName}.open = #{cell}"
            when 2
              f.puts "#{pointName}.high = #{cell}"
            when 3
              f.puts "#{pointName}.low = #{cell}"
            when 4
              f.puts "#{pointName}.close = #{cell}"
            when 5
              f.puts "#{pointName}.volume = #{cell}"

          end
          col += 1
        end
        f.puts "#{pointName}.save(:validate => false)"
        f.puts "\n"
      end
      counter += 1
    end


  end

  # pause briefly before next query  to yahoo finance
  #sleep(6)

end