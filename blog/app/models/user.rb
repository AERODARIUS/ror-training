# frozen_string_literal: true

# User model for authenticate
class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false, length: { minimum: 6 }
  validates :name, presence: true, allow_blank: false
  validates :birthday, presence: true, allow_blank: false
  validate :atleast18

  after_create :create_first_article

  private

  def atleast18
    errors.add(:birthday, 'You must be 18 years or older.') if birthday && birthday < 18.years.ago.to_date
  end

  def create_first_article
    Article.create({ user: self, title: 'First Article', text: "This is the first article of #{name}" })
  end
end
