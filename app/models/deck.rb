class Deck < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 250 }
end
