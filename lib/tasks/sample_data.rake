require 'csv'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_sample_user
    make_sample_deck
    import_sample_cards
  end
end

def make_sample_user
  user = User.create(email: "foobar@foobar",
                     password: "foobar",
                     password_confirmation: "foobar")
  user.confirm!
end

def make_sample_deck
  user = User.find_by_email("foobar@foobar")
  user.decks.create(title: "ALC12000 Words", description: "This is ALC 12000 Words")
end

def import_sample_cards
  user = User.find_by_email("foobar@foobar")
  deck = user.decks.first
  CSV.open("lib/tasks/alc12000_all.csv", 'r').each do |row|
    deck.cards.create(front: row[0], back: row[1], next_study_datetime: Time.now)
  end
end
