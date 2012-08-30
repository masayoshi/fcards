# == Schema Information
#
# Table name: cards
#
#  id                  :integer          not null, primary key
#  front               :text
#  back                :text
#  next_study_datetime :datetime
#  deck_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Card < ActiveRecord::Base
  attr_accessible :back, :front, :next_study_datetime
  belongs_to :deck
  validates :deck_id, presence: true
  validates :front, presence: true, length: { maximum: 1000 }
  validates :back, presence: true, length: { maximum: 1000 }

  scope :need_to_study, where("next_study_datetime < ?", Time.now).order("next_study_datetime asc")

  def study_again!
    self.next_study_datetime = DateTime.now + 20.minutes
    save!
  end

  def study_tommorow!
    self.next_study_datetime = DateTime.now + 1.day
    save!
  end

  def study_three_days_later!
    self.next_study_datetime = DateTime.now + 3.days
    save!
  end

  def study_a_week_later!
    self.next_study_datetime = DateTime.now + 1.week
    save!
  end

  def study_a_month_later!
    self.next_study_datetime = DateTime.now + 1.month
    save!
  end

  def never_study!
    self.next_study_datetime = DateTime.now + 999.year
    save!
  end
end
