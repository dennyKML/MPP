require 'nokogiri'
require 'open-uri'
require 'csv'

doc = Nokogiri::HTML(URI.open('https://www.hospitalsafetygrade.org/all-hospitals'))

hospitals = doc.css('body div#MainContainer div#MainContainerInner section#Content div.columnWrapper div.column1 div#BlinkDBContent_849210 ul li a').map(&:text)

CSV.open("parsing/hospitals.csv", "wb") do |csv|
  csv << %w[ID Name]

  hospitals.each_with_index do |name, index|
    csv << [index + 1, name]
  end
end