class Health < ApplicationRecord
  belongs_to :user
  
  validates :day, presence: true

  validate :getuptime_at_is_invalid_without_a_bedtime_at

  def getuptime_at_is_invalid_without_a_bedtime_at
    errors.add(:bedtime_at, "が必要です") if bedtime_at.blank? && getuptime_at.present?
  end
  
end
