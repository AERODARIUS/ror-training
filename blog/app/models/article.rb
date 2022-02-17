class Article < ApplicationRecord
  
  TOPIC_OPTIONS = %w(others movies gaming books sports)
  enum topic: TOPIC_OPTIONS
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
                    validates :topic, inclusion: { 
                    in: TOPIC_OPTIONS, 
                    message: -> (record,error) {
                      val = record.instance_variable_get(:@__bad_cat_val)
                      return "topic is required" if val.nil?
                      "#{val.inspect} is not a valid topic"
                    }
                  }
  validate :previous_version_date_not_in_future 
  def topic=(val)
    super val
  rescue
    @__bad_cat_val = val
    super nil
  end

  before_save do
    self.previous_version_date = self.updated_at
  end

  private

  def previous_version_date_not_in_future
    unless previous_version_date.present? && previous_version_date < Date.today
      errors.add(:previous_version_date, "can't be in the future")
    end
  end
end
