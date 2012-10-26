require 'nokogiri'
require 'open-uri'

namespace :db do
  desc "Update Card with ACL web"
  task update_cards: :environment do
    deck = Deck.find_by_title("ALC12000 Words")
    deck.cards.need_to_study.each do |card|
      if card.back.length < 20
        url = "http://eow.alc.co.jp/search?q=" + card.front.to_s
        doc = Nokogiri::HTML(open(url))
        card.back = doc.at_css('div#resultsList ul li div').text
        card.save
        sleep 4
      end
    end
  end
end
