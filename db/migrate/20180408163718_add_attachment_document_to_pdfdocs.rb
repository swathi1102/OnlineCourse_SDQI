class AddAttachmentDocumentToPdfdocs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pdfdocs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :pdfdocs, :document
  end
end
