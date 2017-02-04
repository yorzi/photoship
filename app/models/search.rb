class Search < ApplicationRecord

  # params is for advanced search feature.
  validates :keywords, presence: true


end
