class AddAttachmentPhotoToJobPostings < ActiveRecord::Migration
  def self.up
    change_table :job_postings do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :job_postings, :photo
  end
end
