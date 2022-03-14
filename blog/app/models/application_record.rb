# frozen_string_literal: true

# Base active record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
