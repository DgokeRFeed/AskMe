class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+\z/ }

  validates :nickname,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-zA-Zа-яА-Я\d]([a-zA-Zа-яА-Я\d_]*[a-zA-Zа-яА-Я\d])?\Z/ },
            length: { maximum: 40 }

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
