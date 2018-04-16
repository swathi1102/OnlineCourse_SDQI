class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :discussions
  has_many :users, through: :discussions

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_many :pdfdocs, inverse_of: :course, dependent: :nullify
  accepts_nested_attributes_for :pdfdocs, reject_if: :all_blank, allow_destroy: true
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.search(search)
    where("title ILIKE ? OR instructor ILIKE ? ", "%#{search}%", "%#{search}%").all.order('LOWER(title)')
  end


  validates_presence_of :title

end
