class Discussion < ApplicationRecord

  belongs_to :course
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, presence: true
  

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

end

