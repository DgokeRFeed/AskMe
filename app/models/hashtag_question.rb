class HashtagQuestion < ApplicationRecord
  belongs_to :hashtag
  belongs_to :question

  validates :text, presence: true
end
