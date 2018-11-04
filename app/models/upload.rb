class Upload < ApplicationRecord
  has_many_attached :files
  validates :files, presence: true
end
