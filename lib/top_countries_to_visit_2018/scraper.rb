class Scraper

  def self.get_page
    page = Nokogiri::HTML open("https://www.lonelyplanet.com/best-in-travel/countries")
  end

  def self.create_countries
    doc = self.get_page.css(".marketing-article")
      doc.collect do |country|
        name = country.search("h1").text
        information = country.search(".marketing-article__content").text.strip
        land = Country.create(name, information)
      end
  end



end
