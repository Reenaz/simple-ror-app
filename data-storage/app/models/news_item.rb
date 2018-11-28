class NewsItem < ApplicationRecord
  validates :url, uniqueness: true
end
