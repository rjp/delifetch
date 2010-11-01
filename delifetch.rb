require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'time'

deliuser, delitag, s_delicount = ARGV[0..2]

delicount = s_delicount.to_i
if delicount == 0 then
    delicount = 15
end

url = "http://feeds.delicious.com/v2/rss/#{deliuser}/#{delitag}?count=#{delicount}"
url = 'y'

doc = Hpricot::XML(open(url))
doc.search('//channel/item').each do |item|
    title = (item/'title').inner_text
    date = Time.parse((item/'pubDate').inner_text)
    link = (item/'link').inner_text
    text = (item/'description').inner_text
    puts "T:#{title}"
    puts "L:#{link}"
    puts "D:#{text}"
    puts "W:#{date}"
    puts
end
