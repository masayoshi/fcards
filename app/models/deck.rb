# == Schema Information
#
# Table name: decks
#
#  id          :integer          primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#

class Deck < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 250 }
  has_many :cards, dependent: :destroy

  def progress
    if self.cards.count > 0
      100 * self.cards.done.count / self.cards.count
    else
      return 0
    end
  end
end
