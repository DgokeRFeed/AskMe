class Question < ApplicationRecord
  validates :body,
            presence: true,
            length: { maximum: 280 }

  def hidden?
    hidden
  end
end
