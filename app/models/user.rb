class User < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :asked_questions, class_name: "Question", foreign_key: :author_id, dependent: :nullify

  has_secure_password

  before_validation :downcase_attributes

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-z\d]+@[a-z\d]+\.[a-z\d]+\z/ }

  validates :nickname,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-z\d]([a-z\d_]*[a-z\d])?\z/ },
            length: { maximum: 40 }

  validates :header_color,
            format: { with: /\A\#[\da-fA-F]{6}\z/}

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "identicon")

  def to_param
    nickname
  end

  private

  def downcase_attributes
    nickname&.downcase!
    email&.downcase!
  end
end
