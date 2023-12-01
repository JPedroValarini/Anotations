class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :categories, presence: true
  validates :reminder_date, presence: true
end
