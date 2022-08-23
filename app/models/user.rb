class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+\z/ }

  validates :nickname,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-zA-Z\d].\w*\z/ },
            length: { maximum: 40 }

  def downcase_nickname
    nickname.downcase!
  end
end
