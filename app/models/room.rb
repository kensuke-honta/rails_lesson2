class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :introduction, presence: false, length: { maximum: 200 } # 自己紹介の最高文字数は50文字
  validates :price, presence: true
  validates :address, presence: true
  mount_uploader :image, ImageUploader
  scope :with_keyword, ->(keyword) { where("name LIKE ?", "%#{keyword}%") if keyword.present? }
  def self.search_by_address(address)
    where("address LIKE ?", "%#{address}%")
  end


end
