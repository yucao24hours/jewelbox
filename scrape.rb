require 'nokogiri'
require 'open-uri' # http/ftp の URL を、普通のファイルのように開けます。
require 'pp'
require 'pry'

COOKIE = ''

def parse_html(html)
  # usage : Nokogiri::HTML.parse(thing, url = nil, encoding = nil, options = XML::ParseOptions::DEFAULT_HTML, &block)
  #         url is resource where this document is located.
  doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
  puts doc.title
  doc.css('div.message').each do |div|
    binding.pry
    name = div.css('div.name')[0].inner_text.gsub(/\r\n|\r|\n/, '')
    time = div.css('time')[0].inner_text.gsub(/\r\n|\r|\n/, '')
    message = div.css('div.body')[0].inner_text.gsub(/\r\n|\r|\n/, '')
    puts "#{time} (#{name}) #{message}"
  end

  link = doc.css('a.pull-right')[0]

  sleep 1
  parse_html(get_url('https://idobata.io' + link['href'])) if link
end

def get_url(url)
  open(url, 'Cookie' => COOKIE) do |f| 
    f.read
  end
end

# main
url = ARGV[0]

get_url(url)
parse_html(get_url(url))
