require "csv"
tsv = CSV.read("/Users/panto/astrologia/data/conflict-dataset-StartDates.tsv", { :col_sep => "\t" })

# output = `swe/swetest -p4 -fTS -b1.1.1945 -head`

tsv.each do |row|
  data = row[1].split("-")
  output = `swe/swetest -p4 -fTS -b#{data[2]}.#{data[1]}.#{data[0]} -head`
  puts output
end

puts tsv.class