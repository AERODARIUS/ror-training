class Article < ApplicationRecord
  
  TOPIC_OPTIONS = %w(others movies gaming books sports)
  # previous_version_date :datetime
  enum topic: TOPIC_OPTIONS
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
                    validates :topic, inclusion: { 
                    in: TOPIC_OPTIONS, 
                    message: ->(record,error) {
                      val = record.instance_variable_get(:@__bad_cat_val)
                      return "topic is required" if val.nil?
                      "#{val.inspect} is not a valid topic"
                    }
                  }

  def topic=(val)
    super val
  rescue
    @__bad_cat_val = val
    super nil
  end
end
