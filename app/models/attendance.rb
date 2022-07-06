class Attendance < ApplicationRecord
  belongs_to :user
  require 'csv'

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }

  # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  # 退勤時間が存在しない場合、出勤時間は無効
  validate :started_at_is_invalid_without_a_finished_at
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :started_at_than_finished_at_fast_if_invalid
  # 2回目の編集申請時間の、出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :last_edit_day_started_at_than_last_edit_day_finished_at_fast_if_invalid
  
  validate :sample1
  
  validate :sample2
  
  #validate :sample3
  
  

  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if edit_day_started_at.blank? && edit_day_finished_at.present?
  end
  
  def started_at_is_invalid_without_a_finished_at
    errors.add(:finished_at, "が必要です") if edit_day_started_at.present? && edit_day_finished_at.blank?
  end

  def started_at_than_finished_at_fast_if_invalid
    if edit_day_started_at.present? && edit_day_finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if edit_day_started_at > edit_day_finished_at
    end
  end
  
  def last_edit_day_started_at_than_last_edit_day_finished_at_fast_if_invalid
    if last_edit_day_started_at.present? && last_edit_day_finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if last_edit_day_started_at > last_edit_day_finished_at
    end
  end
  
  def sample1
    errors.add(:started_at, "が必要です") if last_edit_day_started_at.blank? && last_edit_day_finished_at.present?
  end
  
  def sample2
    errors.add(:finished_at, "が必要です") if last_edit_day_started_at.present? && last_edit_day_finished_at.blank?
  end
  
  def sample3 #これやると、出勤退勤ボタンが押せなくなった
   errors.add(:finished_at, "が必要です") if last_edit_day_started_at.blank? && last_edit_day_finished_at.blank?
  end
end

