# frozen_string_literal: true

# Model to handle articles
class Article < ApplicationRecord
  include Filterable

  self.per_page = 10
  TOPIC_OPTIONS = %w[others movies gaming books sports].freeze
  enum topic: TOPIC_OPTIONS
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :topic, inclusion: {
    in: TOPIC_OPTIONS,
    message: lambda { |record, _error|
               val = record.instance_variable_get(:@__bad_cat_val)
               return 'topic is required' if val.nil?

               "#{val.inspect} is not a valid topic"
             }
  }
  validate :previous_version_date_not_in_future
  def topic=(val)
    super val
  rescue StandardError
    @__bad_cat_val = val
    super nil
  end

  scope :filter_by_title, ->(title) { where title: title }
  scope :filter_by_topic, ->(topic) { where topic: topic }
  scope :filter_by_start_date, ->(datetime) { where('previous_version_date > ?', parse_date(datetime)) }
  scope :filter_by_end_date, ->(datetime) { where('previous_version_date < ?', parse_date(datetime)) }

  before_save do
    self.previous_version_date = updated_at
  end

  def self.parse_date(datetime)
    DateTime.new(*datetime.values.map(&:to_i))
  end

  private

  def previous_version_date_not_in_future
    return unless previous_version_date.present? && previous_version_date > Date.today

    errors.add(:previous_version_date, "can't be in the future <#{previous_version_date.present?}>")
  end
end
