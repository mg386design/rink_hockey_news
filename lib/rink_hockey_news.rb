require_relative "rink_hockey_news/scraper"

module RinkHockeyNews
  def self.daily_report
    puts "============================================="
    puts " 🛼 RINK HOCKEY DAILY UPDATES - #{Time.now.strftime('%d %B %Y')} 🛼"
    puts "============================================="
    
    data = Scraper.fetch_daily_updates

    puts "\n🔹 [ECU Ely & Chesterton United News]"
    if data[:ecu_news].empty?
      puts "No new updates found for ECU today."
    else
      data[:ecu_news].each { |update| puts "- #{update}" }
    end

    puts "\n🔹 [England U17 Rink Hockey News]"
    if data[:england_u17].empty?
      puts "No new tournament sheets or updates found for U17 today."
    else
      data[:england_u17].each { |update| puts "- #{update}" }
    end
    puts "============================================="
  end
end