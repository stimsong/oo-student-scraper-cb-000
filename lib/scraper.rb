require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))

    doc.css(".student-card a").each do |card|
      temp_hash = {}
      temp_hash[:name] = card.css(".student-name").text
      temp_hash[:location] = card.css(".student-location").text
      temp_hash[:profile_url] = "#{card.attr('href')}"
      students << temp_hash
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
    profile = Nokogiri::HTML(open(profile_url))
    student_profile = {}

    links = profile.css(".social-icon-container").children.css("a").map { |e| e.attribute('href').value}
    links.each do |link|
      if link.include?("linkedin")
        student_profile[:linkedin] = link
      elsif link.include?("github")
        student_profile[:github] = link
      elsif link.include?("twitter")
        student_profile[:twitter] = link
      else
        student_profile[:blog] = link
      end
    end

    student_profile[:profile_quote] = profile.css(".vitals-text-container .profile-quote").text
    student_profile[:bio] = profile.css(".bio-block .description-holder p").text
# binding.pry
  student_profile
  end
end

# Scraper.new
# Scraper.scrape_index_page("./fixtures/student-site/index.html")
