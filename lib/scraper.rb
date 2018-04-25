require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  # attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    # student name
    # doc.css(".student-name").first.text

    # location
    # doc.css(".student-location").first.text

    # profile_url
    # doc.css(".student-card").first...   NOT FINISHED

    binding.pry
  end

  # def get_page
  #   Nokogiri::HTML(open("./fixtures/student-site/index.html"))
  # end

  def self.scrape_profile_page(profile_url)

  end

end

Scraper.new
Scraper.scrape_index_page("./fixtures/student-site/index.html")
