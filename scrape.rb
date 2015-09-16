require 'rubygems'
require 'mechanize'

# http://docs.seattlerb.org/mechanize/GUIDE_rdoc.html

agent = Mechanize.new

page = agent.get('http://google.com')

page.links.each do |link|
  puts link.text
end
