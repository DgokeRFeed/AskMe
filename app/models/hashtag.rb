class Hashtag < ApplicationRecord
  validates :text, presence: true
end
