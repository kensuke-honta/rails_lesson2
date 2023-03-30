class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, :room_id, presence: true
  validates :check_in_date, :check_out_date, presence: true
  validates :num_of_guests, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :check_in_date_cannot_be_later_than_check_out_date

  private

  def check_in_date_cannot_be_later_than_check_out_date
    if check_in_date.present? && check_out_date.present? && check_in_date >= check_out_date
      errors.add(:check_in_date, "はチェックアウト日より前の日付を選択してください")
    end
  end
end
