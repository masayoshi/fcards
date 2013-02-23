# == Schema Information
#
# Table name: cards
#
#  id                  :integer          primary key
#  front               :text
#  back                :text
#  next_study_datetime :timestamp
#  deck_id             :integer
#  created_at          :timestamp        not null
#  updated_at          :timestamp        not null
#  status              :integer          default(0)
#  study_count         :integer          default(0)
#

class Card < ActiveRecord::Base
  attr_accessible :back, :front, :next_study_datetime
  belongs_to :deck
  validates :deck_id, presence: true
  validates :front, presence: true, length: { maximum: 1500 }
  validates :back, presence: true, length: { maximum: 1500 }

  self.per_page = 100

  STATUS_FIRST_TIME = 0
  STATUS_AGAIN = 1
  STATUS_HARD = 2
  STATUS_MEDIUM = 3
  STATUS_EASY = 4
  STATUS_ALMOST_DONE = 5
  STATUS_DONE = 9

  scope :need_to_study, where("next_study_datetime < ?", Time.now ).order("next_study_datetime DESC")
  scope :done, where("status = ?", STATUS_DONE )
  scope :search, lambda { |keyword|
    where 'front like :q or back like :q', q: "%#{keyword}%"
  }

  default_scope order: 'id ASC'

  def study_again!
    self.next_study_datetime = DateTime.now + 20.minutes
    self.status = STATUS_AGAIN
    self.study_count += 1
    save!
  end

  def study_tommorow!
    self.next_study_datetime = DateTime.now + 1.day
    self.status = STATUS_HARD
    self.study_count += 1
    save!
  end

  def study_three_days_later!
    self.next_study_datetime = DateTime.now + 3.days
    self.status = STATUS_MEDIUM
    self.study_count += 1
    save!
  end

  def study_a_week_later!
    self.next_study_datetime = DateTime.now + 1.week
    self.status = STATUS_EASY
    self.study_count += 1
    save!
  end

  def study_a_month_later!
    self.next_study_datetime = DateTime.now + 1.month
    self.status = STATUS_ALMOST_DONE
    self.study_count += 1
    save!
  end

  def never_study!
    self.next_study_datetime = DateTime.now + 999.years
    self.status = STATUS_DONE
    self.study_count += 1
    save!
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |card|
        csv << card.attributes.values_at(*column_names)
      end
    end
  end
end
