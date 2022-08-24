class Question < ApplicationRecord
  belongs_to :user

  validates :body,
            presence: true,
            length: { maximum: 280 }

  def hidden?
    hidden
  end
end
