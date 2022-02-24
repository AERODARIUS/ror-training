class Article < ApplicationRecord
  include Filterable
  
  self.per_page = 10
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

  scope :filter_by_title, -> (title) { where title: title }
  scope :filter_by_topic, -> (topic) { where topic: topic }
  scope :filter_by_start_date, -> (datetime) { where("previous_version_date > ?", Date.parse(datetime)) }
  scope :filter_by_end_date, -> (datetime) { where("previous_version_date < ?", Date.parse(datetime)) }

  before_save do
    self.previous_version_date = self.updated_at
  end

  private

  def previous_version_date_not_in_future
    if previous_version_date.present? && previous_version_date > Date.today
      errors.add(:previous_version_date, "can't be in the future <#{previous_version_date.present?}>")
    end
  end
end
