class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses, dependent: :destroy, foreign_key: 'group_id'
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 50 }
  validate :icon_format
  validate :icon_presence

  private

  def icon_format
    return unless icon.attached? && !icon.content_type.in?(%w[image/jpeg image/png])

    errors.add(:icon, 'needs to be a jpeg or png!')
  end

  def icon_presence
    return if icon.attached?

    errors.add(:icon, 'must be attached')
  end
end
