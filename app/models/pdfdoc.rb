class Pdfdoc < ApplicationRecord
  belongs_to :course

  has_attached_file :document, styles: { thumbnail: "60x60#" }
  validates_attachment :document, content_type: { content_type: "application/pdf" }

  validates_presence_of :name
end
