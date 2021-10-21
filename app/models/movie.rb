class Movie < ApplicationRecord
  # should not be able to destroy self if has bookmarks children
  # without the dependent destroy else movies that are deleted will
  # delete all children bookmarls as well
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
