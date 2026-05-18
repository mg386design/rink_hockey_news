require 'httparty'
require 'nokogiri'

module RinkHockeyNews
  class Scraper
    ERH_URL = "https://competitions.englandrollerhockey.org/"
    ECRHA_URL = "https://www.ecrha.co.uk/leagues/u17s-league-division-1/"

    def self.fetch_daily_updates
      { ecu_news: scrape_erh_for_ecu, england_u17: scrape_ecrha_for_u17 }
    end

    private

    def self.scrape_erh_for_ecu
      response = HTTParty.get(ERH_URL)
      return [] unless response.code == 200
      doc = Nokogiri::HTML(response.body)
      updates = []
      doc.css('.match, .news-item, tr').each do |element|
        text = element.text
        if text.include?("Ely & Chesterton") || text.include?("ECU")
          updates << text.gsub(/\s+/, ' ').strip
        end
      end
      updates.uniq.first(5)
    end

    def self.scrape_ecrha_for_u17
      response = HTTParty.get(ECRHA_URL)
      return [] unless response.code == 200
      doc = Nokogiri::HTML(response.body)
      updates = []
      doc.css('.tournament-sheet, tr, .latest-news').each do |element|
        text = element.text
        if text.include?("U17") || text.include?("England")
          updates << text.gsub(/\s+/, ' ').strip
        end
      end
      updates.uniq.first(5)
    end
  end
end