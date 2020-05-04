class Health < ApplicationRecord
  belongs_to :user
  
  validates :day, presence: true

  validate :getuptime_at_is_invalid_without_a_bedtime_at
  # validate :getuptime_at_earlier_than_bedtime_at_is_invalid
  
  def getuptime_at_is_invalid_without_a_bedtime_at
    errors.add(:bedtime_at, "が必要です") if bedtime_at.blank? && getuptime_at.present?
  end
  
  # def getuptime_at_earlier_than_bedtime_at_is_invalid
  #   if bedtime_at.present? && getuptime_at.present?
  #     errors.add(:bedtime_at, "より早い時間は無効です") if bedtime_at < getuptime_at
  #   end
  # end
end
