class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_many :pdfdocs, inverse_of: :course
  accepts_nested_attributes_for :pdfdocs, reject_if: :all_blank, allow_destroy: true

end
