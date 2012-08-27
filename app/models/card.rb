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
end
