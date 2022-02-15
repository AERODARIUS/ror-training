class Article < ApplicationRecord
  
  TOPIC_OPTIONS = %w(others movies gaming books sports)
  # previous_version_date :datetime
  enum topic: TOPIC_OPTIONS
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :topic, inclusion: { in: TOPIC_OPTIONS }
end
