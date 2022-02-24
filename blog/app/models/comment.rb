class Comment < ApplicationRecord
  belongs_to :article
  self.per_page = 5
end
