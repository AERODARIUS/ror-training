# frozen_string_literal: true

# Additional module for filtering records
module Filterable
  extend ActiveSupport::Concern

  # Source: https://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
  module ClassMethods
    def filter(filtering_params)
      results = where(nil)
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
