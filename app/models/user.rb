class User < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :asked_questions, class_name: "Question", foreign_key: :author_id, dependent: :nullify

  has_secure_password

  before_validation :downcase_attributes

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+\z/ }

  validates :nickname,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-zA-Z\d]([a-zA-Z\d_]*[a-zA-Z\d])?\Z/ },
            length: { maximum: 40 }

  validates :header_color,
            format: { with: /\A\#[\da-fA-F]{6}\Z/}

  private

  def downcase_attributes
    nickname&.downcase!
    email&.downcase!
  end
end
