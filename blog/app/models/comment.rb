# frozen_string_literal: true

# Comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  self.per_page = 5
end
