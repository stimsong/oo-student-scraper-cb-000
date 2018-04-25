require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper
  # attr_accessor :name, :location, :profile_url, :students

  # @@students = []
  # def initialize
  #   @students = []
  # end

  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))

    doc.css(".student-card a").each do |card|
      temp_hash = {}
      temp_hash[:name] = card.css(".student-name").text
      temp_hash[:location] = card.css(".student-location").text
      temp_hash[:profile_url] = "#{card.attr('href')}"
      students << temp_hash
      # binding.pry
    end
    students
    ###   :name = "Name"
    ###  student[name]

    ### students = [
    ###   {name: "G S", location: "Here", profile_url: "/somewhere.html"},
    ###   {name: "Greg", location: "Somewhere", profile_url: "/nowhere.html"}
    ### ]
    ### temp_hash[:name] = "Greg"
    ### students << temp_hash
# binding.pry
  end

  # def self.scrape_index_page(index_url)
  #   doc = Nokogiri::HTML(open(index_url))
  #
  #   doc.css(".student-card a").each do |card|
  #     # student = Student.new
  #     student.name = card.css(".student-name").text
  #     student.location = card.css(".student-location").text
  #     student.profile_url = "#{card.attr('href')}"
  #     # binding.pry
  #   end
  #
  # end

  def self.scrape_profile_page(profile_url)

  end
end

# Scraper.new
# Scraper.scrape_index_page("./fixtures/student-site/index.html")
