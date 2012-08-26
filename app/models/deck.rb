# == Schema Information
#
# Table name: decks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Deck < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 250 }
end
