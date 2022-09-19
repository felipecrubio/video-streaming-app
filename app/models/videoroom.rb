class Videoroom < ApplicationRecord
  has_many :messages
  has_one_attached :video
end
