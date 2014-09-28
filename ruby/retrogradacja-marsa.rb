# Skrypt wyliczający okresy retrogradacji Marsa w latach 1945-2014

# Tip na wyliczanie retrogradacji za pomocą swetest.
#
# Alois Treindl:
# swetest -p9 -fTS -b1.1.2012 -n365 -head|grep -- -|head -1
# 11.04.2012 -0° 0' 0.5851
# swetest -p9 -fTS -b1.1.2012 -n365 -head|grep -- -|tail -1
# 18.09.2012 -0° 0' 0.4083
# The time for such a completely not optimized process is 0.016 seconds, 
# and for this, swetest is called 365 times.
# From: https://groups.yahoo.com/neo/groups/swisseph/conversations/topics/3614

require 'date'

start_date = Date.parse("1.1.1945")
end_date   = Date.parse("31.12.2014")
days_range = end_date - start_date

output = `swe/swetest -p4 -fTS -b1.1.1945 -n#{days_range.to_i} -head`

rows = output.split("\n")

retro = false
text = ""

rows.each do |row|
  if row.include? "-" and !retro
    retro = true
    date = Date.parse(row[0,10])
    text << "#{date} - "
  end
  if !row.include? "-" and retro
    retro = false
    date = Date.parse(row[0,10]) - 1 
    text << "#{date}\n"
    puts text
    text = ""
  end
end

# Retrogradacja Marsa w latach 1945-2014:
# 
# 1945-12-05 - 1946-02-21
# 1948-01-09 - 1948-03-29
# 1950-02-13 - 1950-05-03
# 1952-03-26 - 1952-06-10
# 1954-05-24 - 1954-07-29
# 1956-08-11 - 1956-10-10
# 1958-10-11 - 1958-12-20
# 1960-11-21 - 1961-02-06
# 1962-12-27 - 1963-03-16
# 1965-01-29 - 1965-04-19
# 1967-03-09 - 1967-05-26
# 1969-04-28 - 1969-07-08
# 1971-07-12 - 1971-09-09
# 1973-09-20 - 1973-11-26
# 1975-11-07 - 1976-01-20
# 1977-12-13 - 1978-03-02
# 1980-01-17 - 1980-04-06
# 1982-02-21 - 1982-05-11
# 1984-04-06 - 1984-06-19
# 1986-06-09 - 1986-08-12
# 1988-08-27 - 1988-10-28
# 1990-10-21 - 1991-01-01
# 1992-11-29 - 1993-02-15
# 1995-01-03 - 1995-03-24
# 1997-02-07 - 1997-04-27
# 1999-03-19 - 1999-06-04
# 2001-05-12 - 2001-07-19
# 2003-07-30 - 2003-09-27
# 2005-10-02 - 2005-12-10
# 2007-11-16 - 2008-01-30
# 2009-12-21 - 2010-03-10
# 2012-01-25 - 2012-04-14
# 2014-03-02 - 2014-05-20