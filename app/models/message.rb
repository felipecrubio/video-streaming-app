class Message < ApplicationRecord
  belongs_to :videoroom
  belongs_to :user
end
