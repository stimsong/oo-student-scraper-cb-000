require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper
  # attr_accessor :name, :location, :profile_url

  def self.profile_url(doc)
    url = nil
    # cards = []
    doc.css('.student-card a') do |card|
      url = card.css("#{card['href']}")
    end
    url
  end

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    doc.css(".student-card a").each do |card|
      student = Student.new
      student.name = card.css(".student-name").text
      student.location = card.css(".student-location").text
      student.profile_url = "#{card.attr('href')}"
      binding.pry
    end

    # student name
    # doc.css(".student-name").first.text

    # location
    # doc.css(".student-location").first.text

    # #### profile_url
    # # doc.css(".student-card").first...   NOT FINISHED
    # ## doc.css('.student-card').first.css.("div a") => empty array
    # ## doc.css('.student-card').first.css.("a") =>  array
    # ## doc.css('.student-card').first.css.("a href") => empty array
    # url = []
    # cards = []
    # cards = doc.css('.student-card a')
    # cards do |card|
    #   url << "#{card['href']}"
    # end
    #
    # #### profile_url

  end


  # def get_page
  #   Nokogiri::HTML(open("./fixtures/student-site/index.html"))
  # end

  def self.scrape_profile_page(profile_url)

  end

end

Scraper.new
Scraper.scrape_index_page("./fixtures/student-site/index.html")
